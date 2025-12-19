class axi_test extends uvm_test;

//factory registration
`uvm_component_utils(axi_test)

axi_env axi_env_h;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name,"build_phase is executed",UVM_NONE)
//create an handle and allocate memory for env
axi_env_h=axi_env::type_id::create("axi_env_h",this);
endfunction

function void start_of_simulation_phase(uvm_phase phase);
uvm_top.print_topology();
`uvm_info(get_type_name(),"start_of_simulation_phase verified",UVM_NONE)
endfunction


endclass
