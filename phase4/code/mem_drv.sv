class mem_drv extends uvm_driver#(mem_tx);
//factory registration
`uvm_component_utils(mem_drv);

//insatantiate virtual intf
virtual mem_intf vif;

//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);//auto retrival of config_db variables

if(!uvm_config_db#(virtual mem_intf)::get(this,"","MEM_PIF",vif)) begin
	`uvm_error(get_type_name(),"CONFIG_DB PIF RETRIVAL FAILED")
end
`uvm_info("mem_drv","build_phase verified",UVM_NONE)
endfunction

task run_phase(uvm_phase phase);
`uvm_info("mem_drv","run_phase verified",UVM_NONE)
forever begin
//get the tx
seq_item_port.get_next_item(req); //req->mem_tx is instatiated as req in the uvm_driver 

//print the tx
//req.print();

//drive the tx
drive_tx(req);

//send ack to sqr
seq_item_port.item_done();
end
endtask

//define drive_tx
task drive_tx(mem_tx tx);
#10;
`uvm_info(get_type_name(),"drive_tx is executed",UVM_NONE)
	@(vif.drv_cb);
	vif.drv_cb.addr_i	<=	tx.addr;
	vif.drv_cb.wr_rd_i	<=	tx.wr_rd;
	if(tx.wr_rd==1) begin
		vif.drv_cb.wdata_i	<=	tx.wr_data;
	end
	vif.drv_cb.valid_i	<=	1;//values driven to interface 
	wait(vif.drv_cb.ready_o); //wait for DUT to accecpt this req
	if(tx.wr_rd==0) begin
		tx.rd_data=vif.drv_cb.rdata_o;
	end
	`uvm_info($sformatf("%s_drv_tx_task",get_type_name()),
		    	$sformatf("wr_rd=%s addr=%h data=%h",tx.wr_rd? "WR" : "RD",tx.addr, tx.wr_rd ? tx.wr_data :	tx.rd_data),
						UVM_NONE)
	vif.drv_cb.addr_i	<=	0;
	vif.drv_cb.wr_rd_i	<=	0;
	vif.drv_cb.valid_i	<=	0;
	vif.drv_cb.wdata_i	<=	0;
endtask
endclass
