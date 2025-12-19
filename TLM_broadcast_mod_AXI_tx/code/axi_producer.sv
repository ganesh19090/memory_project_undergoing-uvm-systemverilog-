class axi_producer extends uvm_component;

//factory registration
`uvm_component_utils(axi_producer)

//pass producer port handle
//syntax:uvm_analysis_port#(d_type) handle
uvm_analysis_port#(axi_tx) axi_analysis_producer_h;
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
//alocate memory of tlm
axi_analysis_producer_h=new("axi_analysis_producer_h",this);
endfunction

task run_phase(uvm_phase phase);

//get axi_tx
axi_tx axi_tx_h;

phase.raise_objection(this);


//allocate memory for axi_tx
axi_tx_h=axi_tx::type_id::create("axi_tx_h");

//randomize
axi_tx_h.randomize;

axi_tx_h.print();
#5;
`uvm_info(get_type_name(),"putting the axi_tx into tlm port",UVM_NONE)

//call write method
axi_analysis_producer_h.write(axi_tx_h);
#10;

phase.drop_objection(this);
endtask
endclass
