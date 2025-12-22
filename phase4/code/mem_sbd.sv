class mem_sbd extends uvm_scoreboard;

`uvm_component_utils(mem_sbd);

int arr[int];

uvm_analysis_imp#(mem_tx,mem_sbd) analysis_export;
int matchings,mismatchings;
mem_tx tx;
function new (string name="",uvm_component parent);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
super.build_phase(phase);
analysis_export=new("analysis_export",this);
tx=mem_tx::type_id::create("tx");

endfunction
//
//virtual function void write(mem_tx t);
//	$cast(tx,t);
//	`uvm_info(get_type_name(),$sformatf("addr=%0h wr_data=%0h rd_data=%0h wr_rd=%0b recived to sbd",tx.addr,tx.wr_data,tx.rd_data,tx.wr_rd),UVM_NONE)
//
//endfunction

virtual function void write(mem_tx t);
    if (t.wr_rd) begin
      arr[t.addr] = t.wr_data;
      `uvm_info("SBD",
        $sformatf("WRITE addr=%0h data=%0h", t.addr, t.wr_data),
        UVM_LOW)
    end
    else begin
      if (arr.exists(t.addr) && t.rd_data == arr[t.addr]) begin
        matchings++;
		`uvm_info(get_type_name(),$sformatf("matching=%0d",matchings),UVM_NONE)
      end
	  else begin
        mismatchings++;
		`uvm_info(get_type_name(),$sformatf("mismatching=%0d",mismatchings),UVM_NONE)
   	end
   end
  endfunction



endclass
