module mem_assert(clk,res,wr_rd,wdata,rdata,addr,valid,ready);
input clk,res,wr_rd,valid,ready;
input [`ADDR_WIDTH-1:0]addr;
input [`WIDTH-1:0]wdata,rdata;

property reset;
	@(posedge clk)(res==1)|-> (wr_rd==0 && addr==0 && wdata==0 && rdata==0 && valid==0 && ready==0);
endproperty
RESET: assert property(reset);

property pset;
	@(posedge clk) (res==0) |-> (!($isunknown(wr_rd)) && !($isunknown(addr)) && !($isunknown(wdata)) && !($isunknown(rdata)) && !($isunknown(valid)) && !($isunknown(ready)));
endproperty
PSET: assert property(pset);

property handshaking;
	@(posedge clk) (valid==1) |=> (ready==1);
endproperty
HANDSHAKING: assert property(handshaking);

property writes;
	@(posedge clk) (wr_rd==1) |-> (!($isunknown(wdata)) && !($isunknown(addr)) && (rdata==0));
endproperty
WRITES: assert property(writes);

property reads;
	@(posedge clk) (wr_rd==0) |-> (!($isunknown(rdata)) && !($isunknown(addr)) && (wdata==0));
endproperty
READS: assert property(reads);

endmodule
