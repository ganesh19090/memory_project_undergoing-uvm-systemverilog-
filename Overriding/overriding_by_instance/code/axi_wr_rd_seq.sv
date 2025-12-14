class axi_wr_rd_seq extends uvm_sequence#(mem_tx);
//factory registration
`uvm_object_utils(axi_wr_rd_seq)
//mem_tx req;
bit [`ADDR_WIDTH-1:0] addr_q[$];
bit [`ADDR_WIDTH-1:0] addr_t;
//new construtor
function new(string name="");
super.new(name);
endfunction

task pre_body();
`uvm_info("axi_wr_rd_seq","pre_body executed",UVM_NONE)
endtask

task body();
`uvm_info("axi_wr_rd_seq","body executed",UVM_NONE)
//perform 1wr_1rd  to same addr location
//wr_tx
`uvm_do_with(req, {req.wr_rd == 1;})
addr_q.push_back(req.addr);

//rd_tx
//addr_t=addr_q.pop_front();
//`uvm_do_with(req, {req.wr_rd == 0;
//					req.addr==addr_t;})

endtask

task post_body();
`uvm_info("axi_wr_rd_seq","post_body executed",UVM_NONE)
endtask

endclass
