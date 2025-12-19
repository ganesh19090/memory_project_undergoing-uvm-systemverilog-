class axi_agent extends uvm_agent;
//factory registration
`uvm_component_utils(axi_agent)

//producer and consumer handle
axi_producer axi_producer_h;
my_sub my_sub_n[];
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
my_sub_n=new[5];
endfunction

//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);
`uvm_info(get_type_name(),"build_phase is executed",UVM_NONE)
axi_producer_h=axi_producer::type_id::create("axi_producer_h",this);

//allocate memory for 5 subscriber of class my_sub
for(int i=0;i<5;i++) begin
my_sub_n[i]=my_sub::type_id::create($sformatf("my_sub_n[%0d]", i),this);
end

endfunction

//connect_phase
function void connect_phase(uvm_phase phase);
`uvm_info(get_type_name(),"connect phase is executed",UVM_NONE)
for(int i=0;i<5;i++) begin
axi_producer_h.axi_analysis_producer_h.connect(my_sub_n[i].analysis_export);
end
endfunction
endclass
