`define WIDTH 8
`define DEPTH 16
`define ADDR_WIDTH $clog2(`DEPTH)
class mem_common;
	static string test_name="NWR_NRD";
	static int N=30;
	static mailbox gen2bfm=new();
	static mailbox mon2cov=new();
	static mailbox mon2sbd=new();
	static int matchings;
	static int mismatchings;
endclass
