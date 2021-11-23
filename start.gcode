G90                                                                                             ; use absolute coordinates
M83                                                                                             ; extruder relative mode
M107                                                                                            ; start with the fan off
M140 S[first_layer_bed_temperature]                                                             ; set final bed temp
M104 R170                                                                                       ; set temp nozzle temp
G29 A                                                                                           ; Activate the UBL System.
G29 L1                                                                                          ; Load Mesh from Slot 1
M190 S[first_layer_bed_temperature]                                                             ; wait for bed temp
G28                                                                                             ; home all axis
;G29 J                                                                                          ; 3-point level
;G29 J2                                                                                         ; 4-point level
M109 S{first_layer_temperature[initial_extruder]+extruder_temperature_offset[initial_extruder]} ; wait for final nozzle temp
M300 S1000 P500                                                                                 ; Chirp
M117 Printing....                                                                               ; Start Message
G92 E0.0                                                                                        ; Reset Extruder
G1 X153 F1500                                                                                   ; Move to start position 4-point tilt
G1 Y0 Z0.2 F1500                                                                                ; Move to start position 3-point and 4-point tilt
G1 X73 E10 F1500                                                                                ; Draw the first line
G1 Y0.4 F5000                                                                                   ; Move to side a little
G1 X153 E10 F1500                                                                               ; Draw the second line
;G1 E-3 F2000                                                                                   ; Retract 3mm
G92 E0.0                                                                                        ; Reset Extruder
G1 Z2.0 F2000                                                                                   ; Move Z Axis up little to prevent scratching of Heat Bed
G1 X148 Z0.2 F3000.0                                                                            ; Move over to prevent blob squish