transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Bruno\ Damacena/Documents/laoc2-pratica5 {C:/Users/Bruno Damacena/Documents/laoc2-pratica5/PraticaV.v}
vlog -vlog01compat -work work +incdir+C:/Users/Bruno\ Damacena/Documents/laoc2-pratica5 {C:/Users/Bruno Damacena/Documents/laoc2-pratica5/cache_P.v}
vlog -vlog01compat -work work +incdir+C:/Users/Bruno\ Damacena/Documents/laoc2-pratica5 {C:/Users/Bruno Damacena/Documents/laoc2-pratica5/cache_D.v}
vlog -vlog01compat -work work +incdir+C:/Users/Bruno\ Damacena/Documents/laoc2-pratica5 {C:/Users/Bruno Damacena/Documents/laoc2-pratica5/memory.v}

