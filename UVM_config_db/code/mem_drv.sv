class mem_drv extends uvm_driver#(mem_tx);
//factory registration
`uvm_component_utils(mem_drv);

int drv_count;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info("mem_drv","build_phase verified",UVM_NONE)
	if(uvm_config_db#(int)::get(this,//context
						"",//instance_name
						"INT_COUNT",//field_name
						drv_count//value
						) == 1) begin
		`uvm_info(get_type_name(), $sformatf("RETRIVE WAS PASSED count=%0d",drv_count),UVM_NONE)
						end
						else begin
		`uvm_error(get_type_name(), "RETRIVE WAS FAILED")
						end

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
