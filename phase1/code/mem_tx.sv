//mem_tx
`define WIDTH 8
`define DEPTH 32
`define ADDR_WIDTH $clog2(`DEPTH)
class mem_tx extends uvm_sequence_item;
//factory reagistration
`uvm_object_utils(mem_tx)

rand bit wr_rd;
rand bit [`WIDTH:0] wr_data;
rand bit [`ADDR_WIDTH-1:0] addr;
	bit  [`WIDTH-1:0] rd_data;
	
//constructor
function new(string name="");
super.new(name);
endfunction

	endclass

