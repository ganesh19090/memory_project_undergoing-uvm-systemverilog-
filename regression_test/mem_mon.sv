class mem_mon extends uvm_monitor;
//factory registration
`uvm_component_utils(mem_mon)

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);//calling base class method
`uvm_info("mem_mon","build_phase verified",UVM_NONE)
endfunction

//run_phase
task run_phase(uvm_phase phase);
`uvm_info("mem_mon","run_phase verified",UVM_NONE)
endtask
endclass
