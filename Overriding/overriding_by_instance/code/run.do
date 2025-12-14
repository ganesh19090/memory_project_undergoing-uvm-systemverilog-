#compile
vlog list.svh +incdir+C:/Users/91935/Desktop/uvm-1.2/src
#elaboration
vsim -novopt -suppress 12110 top \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
+uvm_set_verbosity=uvm_test_top.mem_env_h.mem_agent_h.mem_drv_h,_ALL_,UVM_HIGH,time,0 \
+UVM_MAX_QUIT_COUNT=10 \
+UVM_TESTNAME=mem_wr_rd_axi_err_tx_test
#add wave

#run
run -all
