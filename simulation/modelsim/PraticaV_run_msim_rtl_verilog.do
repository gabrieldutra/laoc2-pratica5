transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Documents/laoc2-pratica5 {C:/Users/Aluno/Documents/laoc2-pratica5/PraticaV.v}
vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Documents/laoc2-pratica5 {C:/Users/Aluno/Documents/laoc2-pratica5/sm_cblock.v}
vlog -vlog01compat -work work +incdir+C:/Users/Aluno/Documents/laoc2-pratica5 {C:/Users/Aluno/Documents/laoc2-pratica5/sm_directory.v}

