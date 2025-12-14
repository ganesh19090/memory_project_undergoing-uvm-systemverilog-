class mem_drv extends uvm_driver#(mem_tx);

string name;

//factory registration+field_registration
`uvm_component_utils_begin(mem_drv)
	`uvm_field_string(name,UVM_ALL_ON)
`uvm_component_utils_end

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("mem_drv","build_phase verified",UVM_NONE)

//here we dont call get method  hence automatic data retrival
`uvm_info(get_type_name(), $sformatf("str name=%s",name),UVM_NONE)
endfunction

task run_phase(uvm_phase phase);
`uvm_info("mem_drv","run_phase verified",UVM_NONE)
forever begin
//get the tx
seq_item_port.get_next_item(req); //req->mem_tx is instatiated as req in the uvm_driver 

//print the tx
req.print();

//drive the tx
drive_tx(req);

//send ack to sqr
seq_item_port.item_done();
end
endtask

//define drive_tx
task drive_tx(mem_tx tx);
#10;
`uvm_info("mem_drv","tx is driven to dut using mem_intrf",UVM_NONE)
endtask
endclass
