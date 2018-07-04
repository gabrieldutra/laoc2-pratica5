view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/memory/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/memory/write 
wave create -driver freeze -pattern constant -value 110 -range 2 0 -starttime 0ps -endtime 1000ps sim:/memory/address 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 0ps -endtime 1000ps sim:/memory/data_in 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 1 -starttime 25ps -endtime 75ps Edit:/memory/write 
wave modify -driver freeze -pattern constant -value 001 -range 2 0 -starttime 125ps -endtime 175ps Edit:/memory/address 
wave modify -driver freeze -pattern constant -value 1 -starttime 125ps -endtime 175ps Edit:/memory/write 
wave modify -driver freeze -pattern constant -value 1 -starttime 225ps -endtime 275ps Edit:/memory/write 
wave modify -driver freeze -pattern constant -value 1 -starttime 225ps -endtime 275ps Edit:/memory/write 
wave modify -driver freeze -pattern constant -value 110 -range 2 0 -starttime 225ps -endtime 275ps Edit:/memory/address 
wave modify -driver freeze -pattern constant -value 0011 -range 3 0 -starttime 225ps -endtime 275ps Edit:/memory/data_in 
WaveCollapseAll -1
wave clipboard restore
