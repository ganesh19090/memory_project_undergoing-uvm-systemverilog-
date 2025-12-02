typedef uvm_sequencer#(mem_tx) mem_sqr;
// class mem_sqr extends uvm_sequencer#(mem_tx);
// `uvm_component_utils(mem_sqr) //factory registration
// //mem_agent mem_agent_h;
// //mem_sbd mem_sbd_h;

// function new(string name="",uvm_component parent);
// super.new(name,parent);
// endfunction

// function void build_phase(uvm_phase phase);
// super.build_phase(phase);
// //mem_agent_h=new("mem_agent_h",this);
// //mem_sbd_h=new("mem_sbd_h",this);
// $display("build_phase of mem_sqr is executed");
// endfunction

// function void connect_phase(uvm_phase phase);
// $display("connect phase of mem_sqr functionality is verified");
// //agent.mon need to be connected to sbd
// endfunction

// //end of elaboration_phase
// function void end_of_elaboration_phase(uvm_phase phase);
// $display("end_of_elaboration phase of mem_sqrfunctionality is verified");
// endfunction

// //start of simulation_phase
// function void start_of_simulation_phase(uvm_phase phase);
// $display("start_of_simulation phase of mem_sqr functionality is verified");
// endfunction

// //run_phase
// task run_phase(uvm_phase phase);
// $display("run_phase of mem_sqr is executed");
// endtask

// //extract_phase
// function void extract_phase(uvm_phase phase);
// $display("extract_phase of mem_sqr is executed");
// endfunction

// //check_phase
// function void check_phase(uvm_phase phase);
// $display("checK_phase of mem_sqr is executed");
// endfunction

// endclass

