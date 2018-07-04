view wave 
wave clipboard store
wave create -driver freeze -pattern clock -initialvalue 0 -period 100ps -dutycycle 50 -starttime 0ps -endtime 1000ps sim:/cache_P/clock 
wave create -driver freeze -pattern constant -value 0 -starttime 0ps -endtime 1000ps sim:/cache_P/write 
wave create -driver freeze -pattern constant -value 10 -range 1 0 -starttime 0ps -endtime 1000ps sim:/cache_P/state 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 110 -range 2 0 -starttime 0ps -endtime 1000ps sim:/cache_P/address 
WaveExpandAll -1
wave create -driver freeze -pattern constant -value 0010 -range 3 0 -starttime 0ps -endtime 1000ps sim:/cache_P/data_in 
WaveExpandAll -1
wave modify -driver freeze -pattern constant -value 1 -starttime 25ps -endtime 75ps Edit:/cache_P/write 
WaveCollapseAll -1
wave clipboard restore
