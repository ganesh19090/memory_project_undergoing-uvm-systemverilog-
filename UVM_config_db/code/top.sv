module top;

int count;

initial begin
run_test("mem_wr_rd_test");
end

//set int count in  top module using config db
initial begin
count=100;
uvm_config_db#(int)::set(null,// context
						"*.mem_drv_h",//instance_name
						"INT_COUNT",//field_name
						count//value
						);
end
endmodule
