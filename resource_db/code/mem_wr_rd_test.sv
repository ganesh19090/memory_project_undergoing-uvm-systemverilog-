class mem_wr_rd_test extends uvm_test;
//factory registration
`uvm_component_utils(mem_wr_rd_test)

int count_in_test;
int num_tx_test;
string name_in_test;

mem_env mem_env_h;
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
mem_env_h=mem_env::type_id::create("mem_env_h",this);

//method1:read_by_type
//to retrive
//syntax:uvm_resource_db#(d_type)::read_by_type(scope,value,accessor);

//count 
//if(!uvm_resource_db#(int)::read_by_type("INT",count_in_test,this))
//begin
//	`uvm_error(get_type_name,"RETRIVE FALIED FROM RDBYTYPE");
//end
//`uvm_info(get_type_name,$sformatf("count_in_test=%0d",count_in_test),UVM_NONE)
//
////num_tx
//if(!uvm_resource_db#(int)::read_by_type("INT",num_tx_test,this))
//begin
//	`uvm_error(get_type_name,"RETRIVE FALIED FROM RDBYTYPE");
//end
//`uvm_info(get_type_name,$sformatf("num_tx_test=%0d",num_tx_test),UVM_NONE)
//
////name
//if(!uvm_resource_db#(string)::read_by_type("STRING",name_in_test,this))
//begin
//	`uvm_error(get_type_name,"RETRIVE FALIED FROM RDBYTYPE");
//end
//`uvm_info(get_type_name,$sformatf("name_in_test=%0s",name_in_test),UVM_NONE)

//------------------------------------------------------------------------------------

//method2:read_by_name
//to retrive
//syntax:uvm_resource_db#(d_type)::read_by_name(scope,name,value,accessor);

//count
if(!uvm_resource_db#(int)::read_by_name("INT","count",count_in_test,this))
begin
	`uvm_error(get_type_name,"RETRIVE FALIED FROM RDBYTYPE");
end
`uvm_info(get_type_name,$sformatf("count_in_test=%0d",count_in_test),UVM_NONE)

//num_tx
if(!uvm_resource_db#(int)::read_by_name("INT","num_tx",num_tx_test,this))
begin
	`uvm_error(get_type_name,"RETRIVE FALIED FROM RDBYTYPE");
end
`uvm_info(get_type_name,$sformatf("num_tx_test=%0d",num_tx_test),UVM_NONE)

//name
if(!uvm_resource_db#(string)::read_by_name("STRING","name",name_in_test,this))
begin
	`uvm_error(get_type_name,"RETRIVE FALIED FROM RDBYTYPE");
end
`uvm_info(get_type_name,$sformatf("name_in_test=%s",name_in_test),UVM_NONE)

`uvm_info("mem_wr_rd_test","build_phase verified",UVM_NONE)
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_test","connect_phase verified",UVM_NONE)
endfunction

//end of elaboration
function void end_of_elaboration_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_test","end_of_elaboration_phase verified",UVM_NONE)
endfunction

//start of simulation
function void start_of_simulation_phase(uvm_phase phase);
uvm_top.print_topology();
`uvm_info("mem_wr_rd_test","start_of_simulation_phase verified",UVM_NONE)
endfunction

//run_phase
task run_phase(uvm_phase phase);
//1.instantiate the seq
mem_wr_rd_seq mem_wr_rd_seq_h;
`uvm_info("mem_wr_rd_test","run_phase verified",UVM_NONE)

//2.allocate memory
mem_wr_rd_seq_h=mem_wr_rd_seq::type_id::create("mem_wr_rd_seq_h",this);

`uvm_info("mem_wr_rd_test","run_phase of mem_wr_rd_test is has raised objection",UVM_NONE)
//3.raise the objection
phase.raise_objection(this); //this indicates current class scope
//set the drain time
phase.phase_done.set_drain_time(this,100);

//4. call the start method of thr seq on the sqr
//syntax:seq_name.start(sqr_name);
mem_wr_rd_seq_h.start(mem_env_h.mem_agent_h.mem_sqr_h);

//5. drop the objection
phase.drop_objection(this);
`uvm_info("mem_wr_rd_test","run_phase of mem_wr_rd_test has droped objection",UVM_NONE)

endtask

//extract_phase
function void extract_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_test","extract_phase verified",UVM_NONE);
endfunction

//check_phase
function void check_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_test","check_phase verified",UVM_NONE)
endfunction

//report_phase
function void report_phase(uvm_phase phase);
`uvm_info("mem_wr_rd_test","report_phase of mem_wr_rd_test is verified",UVM_NONE)
endfunction


endclass
