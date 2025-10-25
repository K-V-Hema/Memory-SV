class mem_tx;
	randc bit [`ADDR_WIDTH-1:0]addr;
	rand bit wr_rd;
	rand bit [`WIDTH-1:0]wdata;
	bit [`WIDTH-1:0]rdata;


function void print(input string str="mem_tx");
	$display("--%0t,-----%0s------",$time,str);
	$display("wr_rd=%b",wr_rd);
	$display("wdata=%0d",wdata);
	$display("rdata=%0d",rdata);
	$display("addr=%0d",addr);
endfunction

endclass
