class axi_mon extends uvm_monitor;
//factory registration
`uvm_component_utils(axi_mon)

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);//calling base class method
`uvm_info("axi_mon","build_phase verified",UVM_NONE)
endfunction

//run_phase
task run_phase(uvm_phase phase);
`uvm_info("axi_mon","run_phase verified",UVM_NONE)
endtask
endclass
