interface mem_intf(input logic clk_i,rst_i);

//ports
bit valid_i;
bit wr_rd_i;
bit [`WIDTH-1:0] wdata_i;
bit [`ADDR_WIDTH-1:0] addr_i;
bit [`WIDTH-1:0]	rdata_o;
bit ready_o;

//drv_cb (driver clocking blocks)
clocking drv_cb@(posedge clk_i);
	default input #0 output#1;
	input ready_o;
	input rdata_o;
	output wr_rd_i;
	output valid_i;
	output wdata_i;
	output addr_i;

endclocking

endinterface
