class axi_consumer extends uvm_component;

//factory registration
`uvm_component_utils(axi_consumer)

//pass consumer port handle
//syntax:uvm_blocking_put_imp#(T,IMP) handle
uvm_blocking_put_imp#(axi_tx,axi_consumer) axi_imp_consumer_h;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
//alocate memory of tlm
axi_imp_consumer_h=new("axi_imp_consumer_h",this);
`uvm_info(get_type_name(),"build_Phase is executed",UVM_NONE)
endfunction

task put(axi_tx axi_tx_h);
	`uvm_info(get_type_name(),"consumer put got called",UVM_NONE)
	axi_tx_h.print();
	`uvm_info(get_type_name(),"recieved tx fields",UVM_NONE)

endtask

endclass
