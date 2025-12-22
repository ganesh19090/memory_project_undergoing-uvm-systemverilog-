#compile
vlog list.svh +incdir+C:/Users/91935/Desktop/uvm-1.2/src
#elaboration
vsim -novopt -suppress 12110 top \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
+UVM_TESTNAME=mem_full_wr_rd_test +num_tx=16
 
#add wave
add wave -position insertpoint sim:/top/dut/*
#run
run -all
