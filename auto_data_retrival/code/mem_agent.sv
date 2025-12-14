class mem_agent extends uvm_agent;

//seq,drv,sqr,cov
mem_drv mem_drv_h;
mem_sqr mem_sqr_h;
mem_mon mem_mon_h;

//factory registration
`uvm_component_utils(mem_agent)

//new constructor
function new (string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
//allocate memory for mon,drv,sqr
mem_mon_h=mem_mon::type_id::create("mem_mon_h",this);
mem_drv_h=mem_drv::type_id::create("mem_drv_h",this);
mem_sqr_h=mem_sqr::type_id::create("mem_sqr_h",this);
`uvm_info("mem_agent","build_phase verified",UVM_NONE)
endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
mem_drv_h.seq_item_port.connect(mem_sqr_h.seq_item_export);
`uvm_info("mem_agent","connect_phase verified",UVM_NONE)
endfunction

endclass
