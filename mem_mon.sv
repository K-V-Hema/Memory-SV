class mem_mon;
	mem_tx tx;
	virtual mem_intrf vif;
	task run();
		vif=tb.pif;
		forever begin
			tx=new();
			@(vif.mon_cb);
			if(vif.mon_cb.valid==1 && vif.mon_cb.ready==1) begin
			tx.wr_rd=vif.mon_cb.wr_rd;
			tx.addr=vif.mon_cb.addr;
			tx.wdata=vif.mon_cb.wdata;
			if(vif.mon_cb.wr_rd==0) begin
				@(vif.mon_cb);
				tx.rdata=vif.mon_cb.rdata;
			end
	//	tx.print("mon prints");
	//	$display("[MON] Captured addr=%0d wr_rd=%0b wdata=%0h rdata=%0h",tx.addr, tx.wr_rd, tx.wdata, tx.rdata);
		mem_common::mon2cov.put(tx);
		mem_common::mon2sbd.put(tx);
		end
		end
	endtask
endclass

