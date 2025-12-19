class axi_agent extends uvm_agent;
//factory registration
`uvm_component_utils(axi_agent)

//producer and consumer handle
axi_producer axi_producer_h;
axi_consumer axi_consumer_h;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
axi_producer_h=axi_producer::type_id::create("axi_producer_h",this);
axi_consumer_h=axi_consumer::type_id::create("axi_consumer_h",this);
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
`uvm_info(get_type_name(),"connect phase is executed",UVM_NONE)
axi_consumer_h. axi_get_consumer_h.connect(axi_producer_h.axi_imp_producer_h);
endfunction
endclass
