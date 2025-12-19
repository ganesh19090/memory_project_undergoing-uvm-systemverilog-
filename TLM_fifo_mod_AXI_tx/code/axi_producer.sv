class axi_producer extends uvm_component;

//factory registration
`uvm_component_utils(axi_producer)

//pass producer port handle
//syntax:uvm_blocking_put_port#(d_type) handle
uvm_blocking_put_port#(axi_tx) axi_put_producer_h;
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
//alocate memory of tlm
axi_put_producer_h=new("axi_put_producer_h",this);
endfunction

task run_phase(uvm_phase phase);
phase.raise_objection(this);

repeat(2) begin

//get axi_tx
axi_tx axi_tx_h;

//allocate memory for axi_tx
axi_tx_h=axi_tx::type_id::create("axi_tx_h");

//randomize
axi_tx_h.randomize;

axi_tx_h.print();
#5;
`uvm_info(get_type_name(),"putting the tx into tlm port",UVM_NONE)
//call put method
axi_put_producer_h.put(axi_tx_h);
end

phase.drop_objection(this);
endtask
endclass
