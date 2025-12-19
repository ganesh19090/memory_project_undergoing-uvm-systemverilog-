class axi_producer extends uvm_component;

//factory registration
`uvm_component_utils(axi_producer)

axi_tx axi_tx_h;
//pass producer port handle
//syntax:uvm_blocking_imp_port#(d_type) handle
uvm_blocking_get_imp#(axi_tx,axi_producer) axi_imp_producer_h;
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
//alocate memory of tlm
axi_imp_producer_h=new("axi_imp_producer_h",this);
endfunction

task get(output axi_tx axi_tx_flag);
#10;
`uvm_info(get_type_name(),"get imp of producer called",UVM_NONE)
axi_tx_h=new("axi_tx_h");//create also works
axi_tx_h.randomize;
axi_tx_h.print();
axi_tx_flag=axi_tx_h;
endtask

endclass
