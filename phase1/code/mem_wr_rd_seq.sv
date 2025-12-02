class mem_wr_rd_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_wr_rd_seq)

//constructor
function new(string name="");
super.new(name);
endfunction

//randomize
task pre_body();
//randomize is done
  $display("pre_body of seq is executed");
endtask

task body();
$display("body of seq is executed");
endtask

task post_body();
  $display("post_body of seq is executed");
endtask
endclass

