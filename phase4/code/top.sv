module top;

//1.clk and rst declaration
bit clk,rst;
//2.clk and rst generation
always #5 clk=~clk;//100MHZ

initial begin
	rst=1;
	repeat(2) begin
		@(posedge clk);
		rst=0;
	end
end


//4.physical interface declaration 
//  points the pif interface handle to vif mon and drv
mem_intf pif(clk,rst);

//3.design instantiation
memory dut(
			.clk_i(pif.clk_i),
			.rst_i(pif.rst_i),
			.wr_rd_i(pif.wr_rd_i),
			.valid_i(pif.valid_i),
			.wdata_i(pif.wdata_i),
			.rdata_o(pif.rdata_o),
			.addr_i(pif.addr_i),
			.ready_o(pif.ready_o));

//4.assertion institation
mem_assertion uut(
				.clk_i(pif.clk_i),
				.rst_i(pif.rst_i),
				.wr_rd_i(pif.wr_rd_i),
				.valid_i(pif.valid_i),
				.wdata_i(pif.wdata_i),
				.rdata_o(pif.rdata_o),
				.addr_i(pif.addr_i),
				.ready_o(pif.ready_o));



initial begin
run_test("mem_wr_rd_test");
end

//set the interdface handle into config_db
initial begin
	int num_tx;
  if (!$value$plusargs("num_tx=%d", num_tx)) begin
    num_tx = 10;   // default value
  end
  uvm_config_db#(virtual mem_intf)::set(null,
									 "*",
									 "MEM_PIF",
									 pif
									 );
	uvm_config_db#(int)::set(null,
							 "*",
							 "INT_NUM_TX",
							 num_tx
							 );
	
							
end
endmodule
