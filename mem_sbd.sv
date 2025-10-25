class mem_sbd;
	mem_tx tx;
int ass[*];
	task run();
		forever begin
			mem_common::mon2sbd.get(tx);
			tx.print("mem_sbd");
		if(tx.wr_rd==1) begin
			ass[tx.addr]=tx.wdata;
		end
		else begin
			if(ass[tx.addr]==tx.rdata)begin
				mem_common::matchings++;
			end
			else
				mem_common::mismatchings++;
		end
		end
	endtask
endclass
