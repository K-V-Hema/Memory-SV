class mem_gen;
	mem_tx tx,temp,tmq[$];
	task run();
		case(mem_common::test_name)
			"1WR": begin
				tx=new();
			assert(	tx.randomize() with {tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen");
				end
			"5WR": 
				repeat(5) begin
				tx=new();
				assert(	tx.randomize() with {tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen");
				end

			"NWR": 
				repeat (mem_common::N) begin
				tx=new();
				assert(	tx.randomize() with {tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen");
				end

			"1WR_1RD":  begin
				tx=new();
				assert(	tx.randomize() with {tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen");
				temp=new tx;				
				tx=new();
			assert(	tx.randomize() with {tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen reads");
				end

				"5WR_5RD": begin
				repeat(5) begin
				tx=new();
				assert(	tx.randomize() with {tx.wr_rd==1'b1;tx.rdata==0;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen");
				temp=new tx;
				tmq.push_back(temp);
				end
				repeat(5) begin
				temp=tmq.pop_front();
				tx=new();
			assert(	tx.randomize() with {tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen reads");
				end
				end
				"NWR_NRD": begin
				repeat(mem_common::N) begin
				tx=new();
				assert(	tx.randomize() with {tx.wr_rd==1'b1;});
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen");
				temp=new tx;	
				tmq.push_back(temp);
				end
				repeat(mem_common::N) begin
				temp=tmq.pop_front();
				tx=new();
				assert(	tx.randomize() with {tx.wr_rd==1'b0;tx.addr==temp.addr;tx.wdata==0;});	
				mem_common::gen2bfm.put(tx);
			//	tx.print("mem_gen reads");
				end
				end
			endcase	
	endtask
endclass
