class axi_drv extends uvm_driver#(axi_tx);
//factory registration
`uvm_component_utils(axi_drv);

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("axi_drv","build_phase verified",UVM_FULL)
endfunction

task run_phase(uvm_phase phase);
`uvm_info("axi_drv","run_phase verified",UVM_FULL)
forever begin
//get the tx
seq_item_port.get_next_item(req); //req->axi_tx is instatiated as req in the uvm_driver 

//print the tx
req.print();

//drive the tx
drive_tx(req);

//send ack to sqr
seq_item_port.item_done();
end
endtask

//define drive_tx
task drive_tx(axi_tx tx);
#10;
`uvm_info("axi_drv","tx is driven to dut using axi_intrf",UVM_FULL)
endtask
endclass
