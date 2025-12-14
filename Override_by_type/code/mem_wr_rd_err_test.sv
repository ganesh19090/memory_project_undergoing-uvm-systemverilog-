class mem_wr_rd_err_test extends uvm_test;
//factory registration
`uvm_component_utils(mem_wr_rd_err_test)

mem_env mem_env_h;

//factory handle
uvm_factory factory_h;
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);

//override mem_tx by mem_err_tx
factory_h=uvm_factory::get();

//call syntax:set_type_override_by_type(<orginal class>,<overide class>)
factory_h.set_type_override_by_type(mem_tx::get_type(),
									mem_err_tx::get_type()
									);

//call syntax:set_type_override_by_name("original_name","overdie_class_name",<path>)
//factory_h.set_type_override_by_name("mem_tx",
//									"mem_err_tx"
//									);
mem_env_h=mem_env::type_id::create("mem_env_h",this);
`uvm_info("mem_wr_rd_err_test","build_phase verified",UVM_NONE)
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_err_test","connect_phase verified",UVM_NONE)
endfunction

//end of elaboration
function void end_of_elaboration_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_err_test","end_of_elaboration_phase verified",UVM_NONE)
endfunction

//start of simulation
function void start_of_simulation_phase(uvm_phase phase);
uvm_top.print_topology();
`uvm_info("mem_wr_rd_err_test","start_of_simulation_phase verified",UVM_NONE)

//factory debug print
factory_h.print();
endfunction

//run_phase
task run_phase(uvm_phase phase);
//1.instantiate the seq
mem_wr_rd_seq mem_wr_rd_seq_h;
`uvm_info("mem_wr_rd_err_test","run_phase verified",UVM_NONE)

//2.allocate memory
mem_wr_rd_seq_h=mem_wr_rd_seq::type_id::create("mem_wr_rd_seq_h",this);

`uvm_info("mem_wr_rd_err_test","run_phase of mem_wr_rd_err_test is has raised objection",UVM_NONE)
//3.raise the objection
phase.raise_objection(this); //this indicates current class scope
//set the drain time
phase.phase_done.set_drain_time(this,100);

//4. call the start method of thr seq on the sqr
//syntax:seq_name.start(sqr_name);
mem_wr_rd_seq_h.start(mem_env_h.mem_agent_h.mem_sqr_h);

//5. drop the objection
phase.drop_objection(this);
`uvm_info("mem_wr_rd_err_test","run_phase of mem_wr_rd_err_test has droped objection",UVM_NONE)

endtask

//extract_phase
function void extract_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_err_test","extract_phase verified",UVM_NONE);
endfunction

//check_phase
function void check_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_err_test","check_phase verified",UVM_NONE)
endfunction

//report_phase
function void report_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_err_test","report_phase of mem_wr_rd_err_test is verified",UVM_NONE)
endfunction


endclass
