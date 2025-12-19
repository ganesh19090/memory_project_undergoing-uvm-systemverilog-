
class my_sub extends uvm_subscriber #(axi_tx);

  `uvm_component_utils(my_sub)
	axi_tx axi_tx_h;
  axi_tx tx;

  function new(string name="my_sub", uvm_component parent);
    super.new(name, parent);
  endfunction

  // THIS is where if / $cast / begin-end belong
  function void write(axi_tx t);
    if (!$cast(tx, t)) begin
      `uvm_error(get_type_name(), "Cast failed")
    end
    else begin
      `uvm_info(get_type_name(), "Transaction received", UVM_NONE)
    end
	t.print();
  endfunction

endclass

