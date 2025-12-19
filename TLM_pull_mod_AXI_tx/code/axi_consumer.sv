class axi_consumer extends uvm_component;

//factory registration
`uvm_component_utils(axi_consumer)

axi_tx axi_tx_h;

//pass consumer port handle
//syntax:uvm_blocking_get_imp#(T) handle
uvm_blocking_get_port#(axi_tx) axi_get_consumer_h;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
//alocate memory of tlm
axi_get_consumer_h=new("axi_get_consumer_h",this);
`uvm_info(get_type_name(),"build_Phase is executed",UVM_NONE)
endfunction

task run_phase(uvm_phase phase);
	phase.raise_objection(this);
	`uvm_info(get_type_name(),"run_phase is start",UVM_NONE)
	`uvm_info(get_type_name(),"run_phase is calling get method",UVM_NONE)
	//call get method
	axi_get_consumer_h.get(axi_tx_h);
	`uvm_info(get_type_name(),"run_phase has got value",UVM_NONE)
	axi_tx_h.print();
	`uvm_info(get_type_name(),"run_phase is ended",UVM_NONE)
	phase.drop_objection(this);
endtask
endclass
