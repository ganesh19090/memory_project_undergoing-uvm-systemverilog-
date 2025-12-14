class axi_agent extends uvm_agent;

//seq,drv,sqr,cov
axi_drv axi_drv_h;
axi_sqr axi_sqr_h;
axi_mon axi_mon_h;

//factory registration
`uvm_component_utils(axi_agent)

//new constructor
function new (string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
//allocate memory for mon,drv,sqr
axi_mon_h=axi_mon::type_id::create("axi_mon_h",this);
axi_drv_h=axi_drv::type_id::create("axi_drv_h",this);
axi_sqr_h=axi_sqr::type_id::create("axi_sqr_h",this);
`uvm_info("axi_agent","build_phase verified",UVM_NONE)
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
axi_drv_h.seq_item_port.connect(axi_sqr_h.seq_item_export);
`uvm_info("axi_agent","connect_phase verified",UVM_NONE)
endfunction

endclass

//--------------------------------------------------------------
//# Name                       Type                    Size  Value
//# --------------------------------------------------------------
//# uvm_test_top               mem_wr_rd_test          -     @334 
//#   mem_env_h                mem_env                 -     @348 
//#     axi_agent_h            axi_agent               -     @368 
//#       axi_drv_h            axi_drv                 -     @389 
//#         rsp_port           uvm_analysis_port       -     @408 
//#         seq_item_port      uvm_seq_item_pull_port  -     @398 
//#       axi_mon_h            axi_mon                 -     @380 
//#       axi_sqr_h            uvm_sequencer           -     @418 
//#         rsp_export         uvm_analysis_export     -     @427 
//#         seq_item_export    uvm_seq_item_pull_imp   -     @545 
//#         arbitration_queue  array                   0     -    
//#         lock_queue         array                   0     -    
//#         num_last_reqs      integral                32    'd1  
//#         num_last_rsps      integral                32    'd1  
//#     mem_agent_h            mem_agent               -     @359 
//#       mem_drv_h            mem_drv                 -     @576 
//#         rsp_port           uvm_analysis_port       -     @595 
//#         seq_item_port      uvm_seq_item_pull_port  -     @585 
//#       mem_mon_h            mem_mon                 -     @567 
//#       mem_sqr_h            uvm_sequencer           -     @605 
//#         rsp_export         uvm_analysis_export     -     @614 
//#         seq_item_export    uvm_seq_item_pull_imp   -     @732 
//#         arbitration_queue  array                   0     -    
//#         lock_queue         array                   0     -    
//#         num_last_reqs      integral                32    'd1  
//#         num_last_rsps      integral                32    'd1  
//#   flag                     integral                1     'h0  
//# --------------------------------------------------------------
