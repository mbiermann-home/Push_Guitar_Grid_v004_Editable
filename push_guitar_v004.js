autowatch = 0;
inlets = 1;
outlets = 8; // notes, poly pressure, string offset, status, bend, channel pressure, CC
var offset = 0, channel = 1;
var active = {}, counts = {};
var surface = null, up = null, down = null, upName = '', downName = '';
var grabbed = false, upHeld = false, downHeld = false, ready = false;
var trackId = 0, trackObserver = null, layoutObserver = null, enabledObserver = null, app = null;
var enabled = true;
var pollTask = new Task(reconcile, this);
var updateTask = new Task(reconcile, this);
function openString(s) { return 30 + 5*s - (s >= 6 ? 1 : 0); }
function mapped(p) {
    var index = p - 36;
    if (index < 0 || index >= 64) return p;
    return openString(Math.floor(index/8) + offset) + index%8;
}
function transpose(n) { offset = Math.max(-6, Math.min(11, Math.round(n))); outlet(2, offset); }
function step(n) { transpose(offset+n); }
// Each note owns its output pitch, mode and original transpose until release.
var playMode = 0; // 0=glissando, 1=continuous bends
var bends = {}, pressures = {}, slides = {};
var BEND_RANGE = 48;
function pb(v,ch) { outlet(4,[v,ch]); }
function cp(v,ch) { outlet(5,[v,ch]); }
function cc(n,v,ch) { outlet(6,[n,v,ch]); }
function soundingOn(v,pitch) {
    var dest=v.ch+':'+pitch;
    counts[dest]=(counts[dest]||0)+1;
    v.pitch=pitch;
    outlet(0,[pitch,v.velocity,v.ch]);
}
function soundingOff(v) {
    var dest=v.ch+':'+v.pitch;
    counts[dest]=Math.max(0,(counts[dest]||1)-1);
    if(!counts[dest]) { delete counts[dest]; outlet(0,[v.pitch,0,v.ch]); }
}
function voiceStep(v,bend) {
    if(!v.pad) return 0;
    var displacement=bend*BEND_RANGE/8192;
    // Small hysteresis prevents repeat triggers when resting on a boundary.
    var step=v.step;
    if(displacement>step+0.55) step=Math.floor(displacement+0.45);
    else if(displacement<step-0.55) step=Math.ceil(displacement-0.45);
    return Math.max(-v.col,Math.min(7-v.col,step));
}
function setplaymode(n) {
    playMode=Number(n)>=0.5?1:0;
    outlet(7,playMode?'Smooth':'Stepped');
    // Held fingers keep their current mode. New touches use the selected mode.
}
function note(p,v,ch) {
    ch=ch||1;
    var key=ch+':'+p;
    if(v>0) {
        var index=p-36;
        var voice={ch:ch,source:p,base:mapped(p),velocity:v,mode:playMode,
                   pad:index>=0&&index<64,col:((index%8)+8)%8,step:0,pitch:0};
        if(!active[key]) active[key]=[];
        active[key].push(voice);
        var bend=bends[ch]||0;
        voice.step=voice.mode===0?voiceStep(voice,bend):0;
        pb(voice.mode===0?0:bend,ch);
        soundingOn(voice,Math.max(0,Math.min(127,voice.base+voice.step)));
        if(pressures[ch]!==undefined) cp(pressures[ch],ch);
        if(slides[ch]!==undefined) cc(74,slides[ch],ch);
    } else {
        var queue=active[key];
        if(!queue||!queue.length) return;
        var voice=queue.shift();
        if(!queue.length) delete active[key];
        soundingOff(voice);
    }
}
function pressure(p,v,ch) {
    ch=ch||1;
    var queue=active[ch+':'+p];
    if(queue&&queue.length) outlet(1,[queue[queue.length-1].pitch,v,ch]);
}
function bend(value,ch) {
    ch=ch||1;
    value=Math.max(-8192,Math.min(8191,Math.round(value)));
    bends[ch]=value;
    // Channel 1 is the MPE master: preserve global touch-strip pitch bend.
    if(ch===1) { pb(value,ch); return; }
    var found=false,continuous=false;
    for(var key in active) {
        var queue=active[key];
        for(var i=0;i<queue.length;i++) {
            var voice=queue[i];
            if(voice.ch!==ch) continue;
            found=true;
            if(voice.mode===1) {continuous=true;continue;}
            var step=voiceStep(voice,value);
            if(step===voice.step) continue;
            var target=Math.max(0,Math.min(127,voice.base+step));
            voice.step=step;
            if(target===voice.pitch) continue;
            soundingOff(voice);
            pb(0,ch);
            soundingOn(voice,target);
            if(pressures[ch]!==undefined) cp(pressures[ch],ch);
            if(slides[ch]!==undefined) cc(74,slides[ch],ch);
        }
    }
    pb(found?(continuous?value:0):(playMode===1?value:0),ch);
}
function channelpressure(value,ch) {
    ch=ch||1;pressures[ch]=value;cp(value,ch);
}
function control(number,value,ch) {
    ch=ch||1;
    if(number===74) slides[ch]=value;
    if(number===120||number===123) {
        // Flush translated note ownership before forwarding an all-notes-off.
        for(var key in active) {
            var queue=active[key];
            if(queue.length&&queue[0].ch===ch) {
                while(queue.length) soundingOff(queue.shift());
                delete active[key];
            }
        }
    }
    if(number===121) {bends[ch]=0;pressures[ch]=0;slides[ch]=64;}
    cc(number,value,ch);
}
function panic() {
    for(var dest in counts) {var a=dest.split(':');outlet(0,[Number(a[1]),0,Number(a[0])]);}
    for(var ch=2;ch<=16;ch++) pb(0,ch);
    active={};counts={};bends={};pressures={};slides={};
}
function extractId(a) {
    if (typeof a === 'number') return a;
    if (!a) return 0;
    for (var i=0;i<a.length-1;i++) if (a[i] === 'id') return Number(a[i+1]);
    return 0;
}
function status(s) { outlet(3,s); }
function queueUpdate() { if (ready) updateTask.schedule(0); }
function release() {
    var owned=grabbed;
    grabbed=false; upHeld=false; downHeld=false;
    if (up) up.property='';
    if (down) down.property='';
    if (surface && owned) {
        try { if (upName) surface.call('release_control',upName); } catch(e) {}
        try { if (downName) surface.call('release_control',downName); } catch(e) {}
    }
}
function detach() {
    release();
    if (layoutObserver) layoutObserver.property='';
    surface=null; up=null; down=null; layoutObserver=null; upName=''; downName='';
}
function valueOf(args) {
    if (!args || args[0] !== 'value') return null;
    return Number(args[1]);
}
function upValue(args) {
    var v=valueOf(args); if(v===null || !grabbed) return;
    if(v>0 && !upHeld) step(1);
    upHeld=v>0;
}
function downValue(args) {
    var v=valueOf(args); if(v===null || !grabbed) return;
    if(v>0 && !downHeld) step(-1);
    downHeld=v>0;
}
function discover() {
    var ids=app.get('control_surfaces');
    for (var i=0;i<ids.length-1;i++) {
        if (ids[i] !== 'id' || !Number(ids[i+1])) continue;
        var candidate=new LiveAPI(null,'id '+ids[i+1]);
        var names;
        try { names=candidate.call('get_control_names'); } catch(e) { continue; }
        var un='', dn='', push=false;
        for (var j=0;j<names.length;j++) {
            var name=String(names[j]), normalized=name.toLowerCase().replace(/[^a-z0-9]/g,'');
            if (normalized === 'stepaveupbutton' || normalized === 'stepaveup') un=name;
            if (normalized === 'stepavedownbutton' || normalized === 'stepavedown') dn=name;
        }
        if (!un || !dn) continue;
        // pad_layout is a documented Push property; avoid controllers without it.
        try { var layout=candidate.get('pad_layout'); push=String(layout).indexOf('note.')>=0 || String(layout).indexOf('session')>=0; } catch(e) {}
        if (!push) continue;
        var uid=extractId(candidate.call('get_control',un));
        var did=extractId(candidate.call('get_control',dn));
        if (!uid || !did) continue;
        surface=candidate; upName=un; downName=dn;
        up=new LiveAPI(upValue,'id '+uid); down=new LiveAPI(downValue,'id '+did);
        layoutObserver=new LiveAPI(queueUpdate,'id '+candidate.id);
        layoutObserver.property='pad_layout';
        return true;
    }
    return false;
}
function reconcile() {
    if (!ready) return;
    try {
        if (surface && !Number(surface.id)) detach();
        if (!surface && !discover()) { status('Push buttons: waiting for Push'); return; }
        var selected=extractId(new LiveAPI(null,'live_set view').get('selected_track'));
        var layout=String(surface.get('pad_layout'));
        var shouldGrab=enabled && selected===trackId && layout.indexOf('note.melodic.64_notes')>=0;
        if (!shouldGrab) {
            if (grabbed) release();
            status('Push buttons: select this track / 64 Notes'); return;
        }
        if (!grabbed) {
            surface.call('grab_control',upName);
            try { surface.call('grab_control',downName); }
            catch(e) { surface.call('release_control',upName); throw e; }
            upHeld=false; downHeld=false;
            up.property='value'; down.property='value'; grabbed=true;
        }
        status('Push buttons: connected');
    } catch(e) { detach(); status('Push buttons: reconnecting'); post('Push Guitar v004:',String(e),'\n'); }
}
function init() {
    ready=false; pollTask.cancel(); detach();
    app=new LiveAPI(null,'live_app');
    var device=new LiveAPI(null,'this_device');
    var parent=new LiveAPI(null,'this_device canonical_parent');
    trackId=Number(parent.id);
    trackObserver=new LiveAPI(queueUpdate,'live_set view'); trackObserver.property='selected_track';
    enabledObserver=new LiveAPI(function(a) { if(a[0]==='is_active') {enabled=Number(a[1])!==0; queueUpdate();} },'id '+device.id);
    enabledObserver.property='is_active';
    ready=true; transpose(offset); setplaymode(playMode); reconcile(); pollTask.interval=1000; pollTask.repeat();
}
function notifydeleted() {
    ready=false; pollTask.cancel(); updateTask.cancel(); release();
    if(trackObserver) trackObserver.property='';
    if(enabledObserver) enabledObserver.property='';
    if(layoutObserver) layoutObserver.property='';
}
