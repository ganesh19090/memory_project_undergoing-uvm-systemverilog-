class mem_wr_rd_test extends uvm_test;
`uvm_component_utils(mem_wr_rd_test); //factory registration
mem_env mem_env_h;

function new(string name="",uvm_component parent);//uvm_test is child of uvm_component
super.new(name,parent);
endfunction

//build phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
mem_env_h = mem_env::type_id::create("mem_env_h", this);
  $display("build phase of mem_wr_rd_test functionality is verified");
endfunction

//connect phase
function void connect_phase(uvm_phase phase);
  $display("connect phase of mem_wr_rd_test functionality is verified");
endfunction

//end of elaboration_phase
function void end_of_elaboration_phase(uvm_phase phase);
  $display("end_of_elaboration phase of mem_wr_rd_test functionality is verified");
endfunction

//start of simulation_phase
function void start_of_simulation_phase(uvm_phase phase);
uvm_top.print_topology();
  $display("start_of_simulation phase of mem_wr_rd_test functionality is verified");
endfunction

//run_phase
task run_phase(uvm_phase phase);
$display("run_phase of mem_wr_rd_test is executed");
endtask

//extract_phase
function void extract_phase(uvm_phase phase);
  $display("extract_phase of mem_wr_rd_test is executed");
endfunction

//check_phase
function void check_phase(uvm_phase phase);
  $display("checK_phase of mem_wr_rd_test is executed");
endfunction

//report_phase
function void report_phase(uvm_phase phase);
  $display("report_phase of mem_wr_rd_test  is executed");
endfunction

endclass

//# build phase of mem_wr_rd_test functionality is verified
//# build_phase of mem_agent is executed
//# build_phase of mem_driver is executed
//# build_phase of mem_mon is executed
//# connect phase of mem_drv functionality is verified
//# connect phase of mem_mon functionality is verified
//# connect phase of mem_agent functionality is verified
//# connect phase of mem_env functionality is verified
//# connect phase of mem_wr_rd_test functionality is verified
//# end_of_elaboration phase of mem_drvfunctionality is verified
//# end_of_elaboration phase of mem_monfunctionality is verified
//# end_of_elaboration phase of mem_agentfunctionality is verified
//# end_of_elaboration phase of mem_envfunctionality is verified
//# end_of_elaboration phase of mem_wr_rd_test functionality is verified
//# start_of_simulation phase of mem_drv functionality is verified
//# start_of_simulation phase of mem_mon functionality is verified
//# start_of_simulation phase of mem_agent functionality is verified
//# start_of_simulation phase of mem_env functionality is verified
//# UVM_INFO C:/Users/91935/Desktop/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
//# --------------------------------------------------------------
//# Name                       Type                    Size  Value
//# --------------------------------------------------------------
//# uvm_test_top               mem_wr_rd_test          -     @334 
//#   mem_env_h                mem_env                 -     @347 
//#     mem_agent_h            mem_agent               -     @356 
//#       mem_drv_h            mem_drv                 -     @512 
//#         rsp_port           uvm_analysis_port       -     @531 
//#         seq_item_port      uvm_seq_item_pull_port  -     @521 
//#       mem_mon_h            mem_mon                 -     @366 
//#       mem_sqr_h            uvm_sequencer           -     @375 
//#         rsp_export         uvm_analysis_export     -     @384 
//#         seq_item_export    uvm_seq_item_pull_imp   -     @502 
//#         arbitration_queue  array                   0     -    
//#         lock_queue         array                   0     -    
//#         num_last_reqs      integral                32    'd1  
//#         num_last_rsps      integral                32    'd1  
//# --------------------------------------------------------------
//# 
//# start_of_simulation phase of mem_wr_rd_test functionality is verified
//# run_phase of mem_wr_rd_test is executed
//# run_phase of mem_env is executed
//# run_phase of mem_agent is executed
//# run_phase of mem_mon is executed
//# run_phase of mem_drv is executed
//# extract_phase of mem_drv is executed
//# extract_phase of mem_mon is executed
//# extract_phase of mem_agent is executed
//# extract_phase of mem_env is executed
//# extract_phase of mem_wr_rd_test is executed
//# checK_phase of mem_drv is executed
//# checK_phase of mem_mon is executed
//# checK_phase of mem_agent is executed
//# checK_phase of mem_env is executed
//# checK_phase of mem_wr_rd_test is executed
//# report_phase mem_drv  is executed
//# report_phase of mem_mon  is executed
//# report_phase of mem_agent is executed
//# report_phase of mem_env  is executed
//# report_phase of mem_wr_rd_test  is executed
