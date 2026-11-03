Push Guitar Grid v004 - editable source

Extract both source files into the same folder.
The .maxpat is the exact patch extracted from the working v004 device.
The .js file contains its MIDI processing and Push button integration.

To edit the device GUI in context:
1. Load the working v004 .amxd in Live and click its Edit button.
2. Unfreeze the device if required, then unlock the patcher.
3. Switch to Presentation Mode to arrange the controls shown in Live.
4. Keep GUI elements within the 169-pixel device-view height.
5. Save As a new .amxd so the original working version is preserved.
6. Freeze the edited device before distributing it to embed the JavaScript.

The included .maxpat can be opened separately for editing or reference.
Live integration and musical behavior require running as a Max for Live
MIDI effect in Live. Preserve object IDs, scripting names, patch cords,
and the is_mpe setting when making visual changes.
