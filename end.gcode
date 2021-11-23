G91                      ; use relative coordinates
G92 E0                   ; prepare to retract
G1 E-6 F4800             ; retract the filament
;G1 Z0.5 X20 Y20 F3000   ; wipe from model
G1 Z1 X30 Y30 F3000      ; wipe from model
;G1 E-4 Z0.2 F2400       ; retract and raise Z
;G1 X5 Y5 F3000          ; wipe out
G1 Z20
;G90                     ; use absolute coordinates
;{if max_layer_z < max_print_height}G1 Z{z_offset+min(max_layer_z+2, max_print_height)} F600        ; move print head up{endif}
;G1 X5 Y{print_bed_max[1]*0.8} F{travel_speed*60}                                                   ; present print
;{if max_layer_z < max_print_height-10}G1 Z{z_offset+min(max_layer_z+70, max_print_height-10)} F600 ; move print head further up{endif}
;{if max_layer_z < max_print_height*0.6}G1 Z{max_print_height*0.6} F600 ; Move print head further up{endif}
;G28 X0                  ; move X to min endstops, so the head is out of the way
M106 S0                  ; turn-off fan
M104 S0                  ; turn-off hotend
M140 S0                  ; turn-off bed
M107                     ; turn-off fan
M84 E X Y                ; disable steppers
M117                     ; print completed
M300 S440 P200           ; make print completed tones
M300 S660 P250
M300 S880 P300
