class mem_agent;
	mem_gen gen;
	mem_bfm bfm;
	mem_mon mon;
	mem_cov cov;
	task run();
	$display("agent");
	gen=new();
	bfm=new();
	mon=new();
	cov=new();
	fork
		gen.run();
		bfm.run();
		cov.run();
		mon.run();
	join
	endtask
endclass
