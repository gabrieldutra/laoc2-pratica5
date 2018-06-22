onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /sm_cblock/clock
add wave -noupdate /sm_cblock/write
add wave -noupdate /sm_cblock/miss
add wave -noupdate /sm_cblock/fetch
add wave -noupdate /sm_cblock/invalidateIn
add wave -noupdate /sm_cblock/writeMiss
add wave -noupdate /sm_cblock/readMiss
add wave -noupdate /sm_cblock/writeBack
add wave -noupdate /sm_cblock/invalidateOut
add wave -noupdate /sm_cblock/currentState
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 192
configure wave -valuecolwidth 40
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {659 ps}
view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/sm_cblock/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/sm_cblock/write 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/sm_cblock/miss 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/sm_cblock/fetch 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/sm_cblock/invalidateIn 
wave modify -driver freeze -pattern constant -value 1 -starttime 25ps -endtime 75ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 25ps -endtime 75ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 1 -starttime 25ps -endtime 75ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/miss 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/miss 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/fetch 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/invalidateIn 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/fetch 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/invalidateIn 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/fetch 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 25ps -endtime 75ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/fetch 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/miss 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/miss 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/miss 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/write 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/miss 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/sm_cblock/invalidateIn 
wave modify -driver freeze -pattern constant -value 0 -starttime 125ps -endtime 175ps Edit:/sm_cblock/invalidateIn 
WaveCollapseAll -1
wave clipboard restore
