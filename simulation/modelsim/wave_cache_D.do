onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /cache_D/clock
add wave -noupdate /cache_D/write
add wave -noupdate /cache_D/state
add wave -noupdate /cache_D/owner
add wave -noupdate /cache_D/address
add wave -noupdate /cache_D/data_in
add wave -noupdate /cache_D/current_state
add wave -noupdate /cache_D/current_owner
add wave -noupdate /cache_D/current_address
add wave -noupdate /cache_D/current_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {429 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {458 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/cache_D/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/cache_D/write 
wave create -driver freeze -pattern constant -value 10 -range 1 0 -starttime 0ps -endtime 1000ps sim:/cache_D/state 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 01 -range 1 0 -starttime 0ps -endtime 1000ps sim:/cache_D/owner 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 110 -range 2 0 -starttime 0ps -endtime 1000ps sim:/cache_D/address 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 0ps -endtime 1000ps sim:/cache_D/data_in 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 1 -starttime 25ps -endtime 75ps Edit:/cache_D/write 
WaveCollapseAll -1
wave clipboard restore
