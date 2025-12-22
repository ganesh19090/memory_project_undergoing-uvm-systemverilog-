class mem_mon extends uvm_monitor;
//factory registration
`uvm_component_utils(mem_mon)

uvm_analysis_port#(mem_tx) ap_h;

//virtual interafce instantiation
virtual mem_intf vif;
mem_tx tx;
//new constructor
function new(string name="",uvm_component parent);
super.new(name,parent);
endfunction


//build_phase
function void build_phase(uvm_phase phase);
super.build_phase(phase);//calling base class method
ap_h=new("ap_h",this);
tx =mem_tx::type_id::create("tx");
if(!uvm_config_db#(virtual mem_intf)::get(this,"","MEM_PIF",vif)) begin
	`uvm_error(get_type_name(),"CONFIG_DB PIF RETRIVAL FAILED")
end
`uvm_info("mem_drv","build_phase verified",UVM_NONE)
endfunction

task run_phase(uvm_phase phase);
	forever begin
		@(vif.mon_cb);
		if(vif.valid_i && vif.ready_o) begin
			tx.wr_rd = vif.mon_cb.wr_rd_i;
			tx.addr = vif.mon_cb.addr_i;
			if(tx.wr_rd)
				tx.wr_data=vif.mon_cb.wdata_i;
			else 
				tx.rd_data=vif.mon_cb.rdata_o;
			//call the write method so that tx will reach cov and scorebord
			ap_h.write(tx);
		end
	end
endtask
endclass
