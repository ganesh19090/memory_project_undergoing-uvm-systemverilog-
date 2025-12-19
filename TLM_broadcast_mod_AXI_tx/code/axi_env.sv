class axi_env extends uvm_env;
//factory registration
`uvm_component_utils(axi_env)
axi_agent axi_agent_h;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
axi_agent_h=axi_agent::type_id::create("axi_agent_h",this);
endfunction

endclass
