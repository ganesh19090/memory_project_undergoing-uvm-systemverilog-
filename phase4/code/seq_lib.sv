class mem_wr_rd_seq extends uvm_sequence#(mem_tx);
//factory registration
`uvm_object_utils(mem_wr_rd_seq)
//mem_tx req;
bit [`ADDR_WIDTH-1:0] addr_q[$];
bit [`ADDR_WIDTH-1:0] addr_t;
//new construtor
function new(string name="");
super.new(name);
endfunction

task pre_body();
`uvm_info("mem_wr_rd_seq","pre_body executed",UVM_NONE)
endtask

task body();
`uvm_info("mem_wr_rd_seq","body executed",UVM_NONE)
//perform 1wr_1rd  to same addr location
//wr_tx
`uvm_do_with(req, {req.wr_rd == 1;})
addr_q.push_back(req.addr);

//rd_tx
addr_t=addr_q.pop_front();
`uvm_do_with(req, {req.wr_rd == 0;
					req.addr==addr_t;})

endtask

task post_body();
`uvm_info("mem_wr_rd_seq","post_body executed",UVM_NONE)
endtask

endclass

//-------------------------------------------------------------

//will generate wr and rd for N times
class mem_n_wr_rd_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_n_wr_rd_seq)

mem_wr_rd_seq mem_wr_rd_seq_h;
int num_tx;
uvm_phase phase;

//new constructor
function new(string name="");
super.new(name);
endfunction

task pre_body();
	phase=get_starting_phase();
	if(phase!=null) begin//phase will be null when we map seq to sqr in the run_phase and phase will not be null when we mao seq to sqr in  build_phase because the uvm_sequencer will set the phase value to the default_sequence
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
	end
		`uvm_info(get_type_name,"raise_objection",UVM_NONE)
endtask

task body();	 
	//seq funcitonality is kept in  body

	//get num tx from config_db here auto_retrival dont happen because seq is an object has no phase so we cannot call super.build_phase(phase)	
	`uvm_info(get_type_name,"body of mem_n_wr_rd_seq start",UVM_NONE)
	if(!uvm_config_db#(int)::get(null,
							"",
							"INT_NUM_TX",
							num_tx)
							) begin
		`uvm_error(get_type_name(),"RETRIVAL_FAILED FROM CONFIG_DB") 
		end
	repeat(num_tx) begin
		`uvm_do(mem_wr_rd_seq_h)
	end
		`uvm_info(get_type_name,"body of mem_n_wr_rd_seq end",UVM_NONE)
endtask
task post_body();
	if(phase!=null) begin
		phase.drop_objection(this);
	end
	`uvm_info(get_type_name,"drop_objection",UVM_NONE)
endtask
endclass


//------------------------------------------------------------


//mem_full_wr_rd_seq
//entire DEPTH location of memory seq is generate the tx

class mem_full_wr_rd_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_full_wr_rd_seq)
//property
rand bit [`ADDR_WIDTH-1:0] addr_q[$];

//constraint
constraint addr_c{
	addr_q.size==16;
	unique{addr_q};
}


//constructor
function new(string name="");
super.new(name);
endfunction

task body();
	this.randomize();
	`uvm_info("RAND VALUE",$sformatf("addr_q=%p",addr_q),UVM_NONE)
	//generate the mem DEPTH tx making sure all adrs are unique
	//WR
	`uvm_info(get_type_name(),"WR_TX start", UVM_NONE)
	for(int i=0;i<`DEPTH;i++) begin
		`uvm_do_with(req,{req.wr_rd==1;
						  req.addr==addr_q[i];
						  })
	end
	//RD
	`uvm_info(get_type_name(),"RD_TX start", UVM_NONE)
	for(int i=0;i<`DEPTH;i++) begin
		`uvm_do_with(req,{req.wr_rd==0;
						  req.addr==addr_q[i];
						  })
	end

endtask
endclass
