class mem_cov;
	mem_tx tx;

	covergroup cg;
	//	option.per_instance=1;
		option.name="MEMORY_COVERAGE";
			WR_RD:coverpoint tx.wr_rd{
			//	option.at_least=10;
			//	option.weight=1;
			//	option.comment="wr_rdcoverpoint";
				bins WRITES={1'b1};
				bins READS={1'b0};
				}
			ADDR:coverpoint tx.addr{
				bins ADDR0={[3:0]};
		   	bins ADDR1={[7:4]};
			bins ADDR2={[11:8]};
			bins ADDR3={[15:12]};
		}
	//	CROSS_WR_RD_ADDR: cross WR_RD,ADDR{
	//	option.weight=3;
	//	bins S=binsof(ADDR.ADDR1);
//	bins T=binsof (ADDR) intersect {[2:9]};

endgroup
	function new();
		cg=new();
	endfunction

	task run();
		forever begin
			mem_common::mon2cov.get(tx);
			cg.sample();
		end
	endtask
endclass
