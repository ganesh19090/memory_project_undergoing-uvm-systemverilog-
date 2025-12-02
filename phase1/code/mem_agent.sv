class mem_agent extends uvm_agent;
`uvm_component_utils(mem_agent) //factory registration

//instantiate the cov,mon,sqr,drv
//mem_cov mem_cov_h;
mem_mon mem_mon_h;
mem_sqr mem_sqr_h;
mem_drv mem_drv_h;

function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
//mem_cov_h=new("mem_cov_h",this);
mem_mon_h=new("mem_mon_h",this);
mem_sqr_h=new("mem_sqr_h",this);
mem_drv_h=new("mem_drv_h",this);
$display("build_phase of mem_agent is executed");
endfunction

function void connect_phase(uvm_phase phase);
$display("connect phase of mem_agent functionality is verified");
//sqr need to be connected to drv -we use tlm ports
  //method
  mem_drv_h.seq_item_port.connect(mem_sqr_h.seq_item_export);
//mon need to be connected to cov -we use tlm ports
endfunction

//end of elaboration_phase
function void end_of_elaboration_phase(uvm_phase phase);
$display("end_of_elaboration phase of mem_agentfunctionality is verified");
endfunction

//start of simulation_phase
function void start_of_simulation_phase(uvm_phase phase);
$display("start_of_simulation phase of mem_agent functionality is verified");
endfunction

//run_phase
task run_phase(uvm_phase phase);
$display("run_phase of mem_agent is executed");
endtask

//extract_phase
function void extract_phase(uvm_phase phase);
$display("extract_phase of mem_agent is executed");
endfunction

//check_phase
function void check_phase(uvm_phase phase);
$display("checK_phase of mem_agent is executed");
endfunction

//report_phase
function void report_phase(uvm_phase phase);
  $display("report_phase of mem_agent is executed");
endfunction

endclass



