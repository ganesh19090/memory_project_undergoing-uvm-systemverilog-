#compile
vlog list.svh +incdir+C:/Users/91935/Desktop/uvm-1.2/src
#elaboration
vsim -novopt -suppress 12110 top \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi \
+uvm_set_verbosity=uvm_test_top.mem_env_h.mem_agent_h.mem_drv_h,_ALL_,UVM_HIGH,time,0
#add wave

#run
run -all
