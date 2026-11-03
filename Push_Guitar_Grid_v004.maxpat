{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 1,
      "revision": 4,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      0,
      0,
      960,
      960
    ],
    "openinpresentation": 1,
    "default_fontsize": 12,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "devicewidth": 470,
    "boxes": [
      {
        "box": {
          "id": "push",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            45,
            650,
            22
          ],
          "text": "live.push @play_pad_map serial @play_usage first @play_in_tune_location pad @play_flat_zone 0"
        }
      },
      {
        "box": {
          "id": "in",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            100,
            65,
            22
          ],
          "text": "midiin"
        }
      },
      {
        "box": {
          "id": "parse",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            145,
            135,
            22
          ],
          "text": "midiparse @hires 2"
        }
      },
      {
        "box": {
          "id": "format",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            480,
            145,
            22
          ],
          "text": "midiformat @hires 2"
        }
      },
      {
        "box": {
          "id": "out",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            535,
            70,
            22
          ],
          "text": "midiout"
        }
      },
      {
        "box": {
          "id": "noteunpack",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            230,
            85,
            22
          ],
          "text": "unpack i i"
        }
      },
      {
        "box": {
          "id": "pressureunpack",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            350,
            85,
            22
          ],
          "text": "unpack i i"
        }
      },
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            420,
            45,
            300,
            22
          ],
          "text": "Push Guitar Grid v004",
          "fontsize": 16,
          "presentation": 1,
          "presentation_rect": [
            10,
            8,
            290,
            24
          ]
        }
      },
      {
        "box": {
          "id": "desc",
          "maxclass": "comment",
          "patching_rect": [
            420,
            80,
            330,
            22
          ],
          "text": "Guitar grid + MPE pressure / slide / horizontal play mode",
          "presentation": 0,
          "presentation_rect": [
            10,
            36,
            330,
            20
          ]
        }
      },
      {
        "box": {
          "id": "instruction",
          "maxclass": "comment",
          "patching_rect": [
            420,
            115,
            420,
            22
          ],
          "text": "Push: MPE / Note Pitch Bend ON. Analog: Note PB = 48 st.",
          "presentation": 1,
          "presentation_rect": [
            10,
            30,
            450,
            18
          ]
        }
      },
      {
        "box": {
          "id": "label",
          "maxclass": "comment",
          "patching_rect": [
            420,
            155,
            115,
            22
          ],
          "text": "Last input note:",
          "presentation": 1,
          "presentation_rect": [
            10,
            52,
            110,
            20
          ]
        }
      },
      {
        "box": {
          "id": "monitor",
          "maxclass": "number",
          "patching_rect": [
            540,
            155,
            50,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            124,
            52,
            50,
            20
          ],
          "minimum": 0,
          "maximum": 127
        }
      },
      {
        "box": {
          "id": "bottom",
          "maxclass": "comment",
          "patching_rect": [
            420,
            190,
            350,
            22
          ],
          "text": "At 0: F# / B / E / A / D / G / B / E (bottom \u2192 top)",
          "presentation": 1,
          "presentation_rect": [
            10,
            101,
            450,
            18
          ]
        }
      },
      {
        "box": {
          "id": "engine",
          "maxclass": "newobj",
          "patching_rect": [
            200,
            430,
            180,
            22
          ],
          "text": "js push_guitar_v004.js",
          "numinlets": 1,
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "noteinput",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            230,
            85,
            22
          ],
          "text": "pack i i i"
        }
      },
      {
        "box": {
          "id": "noteprepend",
          "maxclass": "newobj",
          "patching_rect": [
            260,
            230,
            115,
            22
          ],
          "text": "prepend note"
        }
      },
      {
        "box": {
          "id": "noteoutput",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            285,
            85,
            22
          ],
          "text": "unpack i i i"
        }
      },
      {
        "box": {
          "id": "notefinal",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            285,
            80,
            22
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "pressureinput",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            350,
            85,
            22
          ],
          "text": "pack i i i"
        }
      },
      {
        "box": {
          "id": "pressureprepend",
          "maxclass": "newobj",
          "patching_rect": [
            260,
            350,
            115,
            22
          ],
          "text": "prepend pressure"
        }
      },
      {
        "box": {
          "id": "pressureoutput",
          "maxclass": "newobj",
          "patching_rect": [
            150,
            405,
            85,
            22
          ],
          "text": "unpack i i i"
        }
      },
      {
        "box": {
          "id": "pressurefinal",
          "maxclass": "newobj",
          "patching_rect": [
            270,
            405,
            80,
            22
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "ready",
          "maxclass": "newobj",
          "patching_rect": [
            35,
            580,
            100,
            22
          ],
          "text": "live.thisdevice"
        }
      },
      {
        "box": {
          "id": "defer",
          "maxclass": "newobj",
          "patching_rect": [
            145,
            580,
            70,
            22
          ],
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "init",
          "maxclass": "message",
          "patching_rect": [
            230,
            580,
            50,
            22
          ],
          "text": "init"
        }
      },
      {
        "box": {
          "id": "translabel",
          "maxclass": "comment",
          "patching_rect": [
            420,
            240,
            145,
            22
          ],
          "text": "Transpose (strings):",
          "presentation": 1,
          "presentation_rect": [
            10,
            77,
            140,
            20
          ]
        }
      },
      {
        "box": {
          "id": "trans",
          "maxclass": "live.numbox",
          "patching_rect": [
            575,
            240,
            55,
            22
          ],
          "varname": "transpose_strings",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "presentation": 1,
          "presentation_rect": [
            155,
            77,
            50,
            20
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Transpose Strings",
              "parameter_shortname": "Strings",
              "parameter_type": 1,
              "parameter_mmin": -6,
              "parameter_mmax": 11,
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ]
            }
          }
        }
      },
      {
        "box": {
          "id": "transpre",
          "maxclass": "newobj",
          "patching_rect": [
            575,
            275,
            125,
            22
          ],
          "text": "prepend transpose"
        }
      },
      {
        "box": {
          "id": "settrans",
          "maxclass": "newobj",
          "patching_rect": [
            710,
            275,
            85,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "down",
          "maxclass": "message",
          "patching_rect": [
            650,
            240,
            60,
            22
          ],
          "text": "step -1",
          "presentation": 1,
          "presentation_rect": [
            220,
            77,
            58,
            20
          ]
        }
      },
      {
        "box": {
          "id": "up",
          "maxclass": "message",
          "patching_rect": [
            720,
            240,
            60,
            22
          ],
          "text": "step 1",
          "presentation": 1,
          "presentation_rect": [
            285,
            77,
            58,
            20
          ]
        }
      },
      {
        "box": {
          "id": "status",
          "maxclass": "message",
          "patching_rect": [
            420,
            310,
            420,
            22
          ],
          "text": "Push buttons: connecting",
          "presentation": 1,
          "presentation_rect": [
            10,
            150,
            450,
            18
          ]
        }
      },
      {
        "box": {
          "id": "setstatus",
          "maxclass": "newobj",
          "patching_rect": [
            710,
            350,
            85,
            22
          ],
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "bendinput",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            670,
            80,
            22
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "bendpre",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            670,
            180,
            22
          ],
          "text": "prepend bend"
        }
      },
      {
        "box": {
          "id": "bendout",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            670,
            90,
            22
          ],
          "text": "unpack i i"
        }
      },
      {
        "box": {
          "id": "channelpressureinput",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            730,
            80,
            22
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "channelpressurepre",
          "maxclass": "newobj",
          "patching_rect": [
            130,
            730,
            180,
            22
          ],
          "text": "prepend channelpressure"
        }
      },
      {
        "box": {
          "id": "channelpressureout",
          "maxclass": "newobj",
          "patching_rect": [
            340,
            730,
            90,
            22
          ],
          "text": "unpack i i"
        }
      },
      {
        "box": {
          "id": "ccunpack",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            790,
            90,
            22
          ],
          "text": "unpack i i"
        }
      },
      {
        "box": {
          "id": "ccpack",
          "maxclass": "newobj",
          "patching_rect": [
            140,
            790,
            90,
            22
          ],
          "text": "pack i i i"
        }
      },
      {
        "box": {
          "id": "ccpre",
          "maxclass": "newobj",
          "patching_rect": [
            250,
            790,
            130,
            22
          ],
          "text": "prepend control"
        }
      },
      {
        "box": {
          "id": "ccout",
          "maxclass": "newobj",
          "patching_rect": [
            440,
            790,
            100,
            22
          ],
          "text": "unpack i i i"
        }
      },
      {
        "box": {
          "id": "ccfinal",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            790,
            80,
            22
          ],
          "text": "pack i i"
        }
      },
      {
        "box": {
          "id": "mpezone",
          "maxclass": "newobj",
          "patching_rect": [
            30,
            850,
            300,
            22
          ],
          "text": "mpeformat @masterchan 1 @chanrange 15"
        }
      },
      {
        "box": {
          "id": "modelabel",
          "maxclass": "comment",
          "patching_rect": [
            430,
            830,
            120,
            22
          ],
          "text": "Stepped",
          "presentation": 1,
          "presentation_rect": [
            10,
            124,
            110,
            20
          ]
        }
      },
      {
        "box": {
          "id": "mode",
          "maxclass": "live.text",
          "patching_rect": [
            560,
            830,
            260,
            22
          ],
          "varname": "horizontal_mode",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ],
          "parameter_enable": 1,
          "presentation": 1,
          "presentation_rect": [
            125,
            124,
            280,
            23
          ],
          "saved_attribute_attributes": {
            "valueof": {
              "parameter_longname": "Horizontal Play Mode",
              "parameter_shortname": "Play Mode",
              "parameter_type": 2,
              "parameter_enum": [
                "Stepped",
                "Smooth"
              ],
              "parameter_initial_enable": 1,
              "parameter_initial": [
                0
              ],
              "parameter_mmin": 0,
              "parameter_mmax": 1,
              "parameter_steps": 2
            }
          },
          "mode": 1,
          "active": 1,
          "outputmode": 0,
          "text": "Stepped / Retrigger",
          "texton": "Smooth Glide",
          "annotation": "Click to switch. Applies to new touches. Push Note Pitch Bend must be ON."
        }
      },
      {
        "box": {
          "id": "modepre",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            870,
            120,
            22
          ],
          "text": "prepend setplaymode"
        }
      },
      {
        "box": {
          "id": "modenote",
          "maxclass": "comment",
          "patching_rect": [
            430,
            905,
            330,
            22
          ],
          "text": "Mode changes apply to the next touch.",
          "presentation": 0,
          "presentation_rect": [
            10,
            200,
            330,
            18
          ]
        }
      },
      {
        "box": {
          "id": "panic",
          "maxclass": "message",
          "patching_rect": [
            750,
            870,
            60,
            22
          ],
          "text": "panic",
          "presentation": 1,
          "presentation_rect": [
            410,
            124,
            45,
            22
          ]
        }
      },
      {
        "box": {
          "id": "pressurereverse",
          "maxclass": "newobj",
          "patching_rect": [
            680,
            350,
            70,
            22
          ],
          "text": "zl rev"
        }
      },
      {
        "box": {
          "id": "setmodestatus",
          "maxclass": "newobj",
          "text": "prepend set",
          "patching_rect": [
            700,
            905,
            100,
            22
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "in",
            0
          ],
          "destination": [
            "parse",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "format",
            0
          ],
          "destination": [
            "out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            0
          ],
          "destination": [
            "noteunpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            1
          ],
          "destination": [
            "pressureunpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            3
          ],
          "destination": [
            "format",
            3
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            6
          ],
          "destination": [
            "format",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteunpack",
            0
          ],
          "destination": [
            "monitor",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteunpack",
            1
          ],
          "destination": [
            "noteinput",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteunpack",
            0
          ],
          "destination": [
            "noteinput",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            6
          ],
          "destination": [
            "noteinput",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteinput",
            0
          ],
          "destination": [
            "noteprepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteprepend",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            0
          ],
          "destination": [
            "noteoutput",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteoutput",
            2
          ],
          "destination": [
            "format",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteoutput",
            1
          ],
          "destination": [
            "notefinal",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "noteoutput",
            0
          ],
          "destination": [
            "notefinal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "notefinal",
            0
          ],
          "destination": [
            "format",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureunpack",
            1
          ],
          "destination": [
            "pressureinput",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureunpack",
            0
          ],
          "destination": [
            "pressureinput",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            6
          ],
          "destination": [
            "pressureinput",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureinput",
            0
          ],
          "destination": [
            "pressureprepend",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureprepend",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            1
          ],
          "destination": [
            "pressureoutput",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureoutput",
            2
          ],
          "destination": [
            "format",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureoutput",
            1
          ],
          "destination": [
            "pressurefinal",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressureoutput",
            0
          ],
          "destination": [
            "pressurefinal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready",
            0
          ],
          "destination": [
            "defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "defer",
            0
          ],
          "destination": [
            "init",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "trans",
            0
          ],
          "destination": [
            "transpre",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transpre",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            2
          ],
          "destination": [
            "settrans",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "settrans",
            0
          ],
          "destination": [
            "trans",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "down",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "up",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            3
          ],
          "destination": [
            "setstatus",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "setstatus",
            0
          ],
          "destination": [
            "status",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            6
          ],
          "destination": [
            "bendinput",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            5
          ],
          "destination": [
            "bendinput",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bendinput",
            0
          ],
          "destination": [
            "bendpre",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bendpre",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            4
          ],
          "destination": [
            "bendout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bendout",
            1
          ],
          "destination": [
            "format",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "bendout",
            0
          ],
          "destination": [
            "format",
            5
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            6
          ],
          "destination": [
            "channelpressureinput",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            4
          ],
          "destination": [
            "channelpressureinput",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "channelpressureinput",
            0
          ],
          "destination": [
            "channelpressurepre",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "channelpressurepre",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            5
          ],
          "destination": [
            "channelpressureout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "channelpressureout",
            1
          ],
          "destination": [
            "format",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "channelpressureout",
            0
          ],
          "destination": [
            "format",
            4
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            2
          ],
          "destination": [
            "ccunpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccunpack",
            1
          ],
          "destination": [
            "ccpack",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccunpack",
            0
          ],
          "destination": [
            "ccpack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "parse",
            6
          ],
          "destination": [
            "ccpack",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccpack",
            0
          ],
          "destination": [
            "ccpre",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccpre",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            6
          ],
          "destination": [
            "ccout",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccout",
            2
          ],
          "destination": [
            "format",
            6
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccout",
            1
          ],
          "destination": [
            "ccfinal",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccout",
            0
          ],
          "destination": [
            "ccfinal",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ccfinal",
            0
          ],
          "destination": [
            "format",
            2
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ready",
            0
          ],
          "destination": [
            "mpezone",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mpezone",
            0
          ],
          "destination": [
            "out",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mode",
            0
          ],
          "destination": [
            "modepre",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "modepre",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "panic",
            0
          ],
          "destination": [
            "engine",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressurefinal",
            0
          ],
          "destination": [
            "pressurereverse",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "pressurereverse",
            0
          ],
          "destination": [
            "format",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "engine",
            7
          ],
          "destination": [
            "setmodestatus",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "setmodestatus",
            0
          ],
          "destination": [
            "modelabel",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "push_guitar_v004.js",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0,
    "parameters": {
      "trans": [
        "Transpose Strings",
        "Strings",
        0
      ],
      "parameterbanks": {
        "0": {
          "index": 0,
          "name": "Guitar Grid",
          "parameters": [
            "trans",
            "mode",
            "-",
            "-",
            "-",
            "-",
            "-",
            "-"
          ]
        }
      },
      "mode": [
        "Horizontal Play Mode",
        "Play Mode",
        0
      ]
    },
    "is_mpe": 1
  }
}