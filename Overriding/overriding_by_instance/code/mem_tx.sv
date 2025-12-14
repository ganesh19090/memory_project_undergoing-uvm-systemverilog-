`define WIDTH 16
`define DEPTH 32
`define ADDR_WIDTH $clog2(`DEPTH)
class mem_tx extends uvm_sequence_item;
rand bit wr_rd;
rand bit [`WIDTH-1:0] wr_data;
rand bit [`ADDR_WIDTH-1:0] addr;
	 bit [`WIDTH-1:0] rd_data;

//factory registration+field registration
`uvm_object_utils_begin(mem_tx)
	//use field_macros
	`uvm_field_int(wr_rd,UVM_ALL_ON) //uvm_ALL_ON -all factory inbuild methods should be available for wr_rd field
	`uvm_field_int(wr_data,UVM_ALL_ON) 
	`uvm_field_int(addr,UVM_ALL_ON) 
	`uvm_field_int(rd_data,UVM_ALL_ON) 
`uvm_object_utils_end

//new constructor
function new(string name="");
super.new(name);
endfunction
endclass
