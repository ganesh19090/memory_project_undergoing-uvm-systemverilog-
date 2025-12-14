module top;
string name;

initial begin
run_test("mem_wr_rd_test");
end

//automatic data retrival is only applicable for int and string
//set the int count and string name using config_db set methods
initial begin
	name="UVM_THY";
	uvm_config_db#(string)::set(null,
								"*",
								"STR_NAME",
								name
								);

end


endmodule
