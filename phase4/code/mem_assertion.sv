module mem_assertion(clk_i,rst_i,wr_rd_i,addr_i,wdata_i,rdata_o,valid_i,ready_o);
input clk_i,rst_i,wr_rd_i,valid_i,ready_o;
input [`ADDR_WIDTH-1:0]addr_i;
input [`WIDTH-1:0]wdata_i,rdata_o;

property reset;
@(posedge clk_i)(rst_i==1) |-> ##0 (wr_rd_i==0 && valid_i==0 && ready_o==0 && addr_i==0 && wdata_i==0 && rdata_o==0);
endproperty
RESET:assert property(reset);
  
//   assert property (reset)
//     $display("ASSERTION PASSED: Reset cleared all signals at %0t", $time);
//   else
//     $error("ASSERTION FAILED: Signals not zero during reset at %0t", $time);
//---------------------------------------------------------------------------------------------
property preset;
@(posedge clk_i)(rst_i==0) |-> ##0 ((!($isunknown(wr_rd_i))) && (!($isunknown(addr_i))) && (!($isunknown(wdata_i))) && (!($isunknown(rdata_o))) && (!($isunknown(ready_o))) && (!($isunknown(valid_i))));
endproperty
PRESET:assert property(preset);
  
//   assert property (preset)
//     $display("ASSERTION PASSED: pReset cleared all signals at %0t", $time);
//   else
//     $error("ASSERTION FAILED: Signals not zero during reset at %0t", $time);
//---------------------------------------------------------------------------------------------
property handshaking;
  @(posedge clk_i) (valid_i==1) |-> ##1 (ready_o==1);
endproperty
HANDSHAKING:assert property (handshaking);
  
//    assert property (handshaking)
//     $display("ASSERTION PASSED: valid_i→ready_o handshake succeeded at %0t", $time);
//   else
//     $error("ASSERTION FAILED: ready_o not high cycle after valid_i @%0t", $time);

//---------------------------------------------------------------------------------------------
property writes;
@(posedge clk_i) (wr_rd_i==1) |-> ((!($isunknown(addr_i))) && (!($isunknown(wdata_i))));
endproperty
WRITES:assert property(writes);
  
   assert property (writes)
     $display("ASSERTION PASSED: Valid write (addr_i=%0h, wdata_i=%0h) at %0t", addr_i, wdata_i, $time);
  else
    $error("ASSERTION FAILED: Write occurred with unknown addr_i/wdata_i at %0t", $time);

//---------------------------------------------------------------------------------------------
property reads;
@(posedge clk_i) (wr_rd_i==0) |-> ((!($isunknown(addr_i))) && (!($isunknown(rdata_o))));
endproperty
READS:assert property(reads);
  
//   assert property (reads)
//     $display("ASSERTION PASSED: Valid read (addr_i=%0d, rdata_o=%0d) at %0t", addr_i, rdata_o, $time);
//   else
//     $error("ASSERTION FAILED: Read occurred with unknown addr_i/rdata_o at %0t", $time);

//---------------------------------------------------------------------------------------------
property hand;
@(posedge clk_i) (valid_i==0) |-> ##1 (ready_o==0);
endproperty 
HAND:assert property(hand);
endmodule
