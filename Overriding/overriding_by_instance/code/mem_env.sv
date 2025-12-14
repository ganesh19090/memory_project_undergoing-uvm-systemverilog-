class mem_env extends uvm_env;
mem_agent mem_agent_h;
axi_agent axi_agent_h;
//factory registration
`uvm_component_utils(mem_env)

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
mem_agent_h=mem_agent::type_id::create("mem_agent_h",this);
axi_agent_h=axi_agent::type_id::create("axi_agent_h",this);
`uvm_info("mem_env","build_phase verified",UVM_NONE)
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
`uvm_info("mem_env","connect_phase verified",UVM_NONE)
endfunction


endclass
