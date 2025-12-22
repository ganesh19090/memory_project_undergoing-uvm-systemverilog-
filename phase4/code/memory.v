`define WIDTH 16
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH)
module memory(clk_i,rst_i,wr_rd_i,valid_i,wdata_i,rdata_o,addr_i,ready_o);

//declaration
input clk_i,rst_i,valid_i,wr_rd_i;
input [`WIDTH-1:0] wdata_i;
input [`ADDR_WIDTH-1:0] addr_i;
output reg [`WIDTH-1:0]	rdata_o;
output reg ready_o;

reg [`WIDTH-1:0] mem [`DEPTH-1:0];

integer i;
//rst =1 make all reg signals to 0
always @(posedge clk_i) begin
	if(rst_i==1) begin
		ready_o=0;
		rdata_o=0;
			for(i=0;i<`DEPTH;i=i+1) begin
				mem[i]=0;
			end
	end

else begin
	if(valid_i==1) begin
		ready_o=1;
		if(wr_rd_i==1) begin
			mem[addr_i]=wdata_i;//wr
		end
		else begin
			rdata_o=mem[addr_i];//rd
		end
	end	
		else begin
			ready_o=0;
		end
end
end
endmodule
