module tb;
	reg clk,res;
	mem_env env;
	mem_intrf pif(clk,res);
	mem dut(.clk(pif.clk),
			   .res(pif.res),
			   .wr_rd(pif.wr_rd),
			   .addr(pif.addr),
			   .wdata(pif.wdata),
			   .rdata(pif.rdata),
			   .valid(pif.valid),
			   .ready(pif.ready));
	mem_assert uut(.clk(pif.clk),
			   .res(pif.res),
			   .wr_rd(pif.wr_rd),
			   .addr(pif.addr),
			   .wdata(pif.wdata),
			   .rdata(pif.rdata),
			   .valid(pif.valid),
			   .ready(pif.ready));

	always #5 clk=~clk;
	initial begin
		clk=0;
		res=1;
		repeat(2) @(posedge clk);
		res=0;
	env=new();
	env.run();
	end
	initial begin
		#2000;
		if(mem_common::matchings!=0 && mem_common::mismatchings==0)begin
		$display("passed");
		$display("matchings=%0d,mismatchings=%0d",mem_common::matchings,mem_common::mismatchings);
		end
		else begin
		$display("failed");
		$display("matchings=%0d,mismatchings=%0d",mem_common::matchings,mem_common::mismatchings);
		end
		$finish;
	end
endmodule
