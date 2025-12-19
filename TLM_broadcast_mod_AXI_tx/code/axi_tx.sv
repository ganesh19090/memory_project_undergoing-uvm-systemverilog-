class axi_tx extends uvm_sequence_item;

//write axi_tx
 rand bit xwrite;
  rand bit[31:0]xaddr;
  rand bit[31:0]xdata;
  int count;

//factory registration
`uvm_object_utils_begin(axi_tx)
	`uvm_field_int(xwrite,UVM_ALL_ON)
	`uvm_field_int(xaddr,UVM_ALL_ON)
	`uvm_field_int(xdata,UVM_ALL_ON)
`uvm_object_utils_end
//new constructor
function new (string name="axi_tx");
super.new(name);
endfunction


endclass
