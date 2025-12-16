module top;
initial begin
run_test("mem_wr_rd_test");
end

//we are going to set int variable called count
//we are going to set int variable called num_tx
//we are going to set string variable called name

initial begin
//synatx:uvm_resource_db#(int)::set(scope,name,value,accessor);
uvm_resource_db#(int)::set("INT","count",10,null);
uvm_resource_db#(int)::set("INT","num_tx",20,null);
uvm_resource_db#(string)::set("STRING","name","UVM_THY",null);
end
endmodule
