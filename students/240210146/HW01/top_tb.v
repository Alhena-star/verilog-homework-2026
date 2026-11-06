`timescale 1ns/1ns

module top_tb;
	wire clk;
	reg clr;
	reg en;
	wire[9:0] q;
	integer i;
	integer bit_cnt;
	integer error;

	clk_gen clk_gen_inst(clk);
	cd4017 cd4017_inst(clk,en,clr,q);

	initial
	begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		clr=1;
		en=0;
		error=0;
		$monitor("time=%0dns clr=%b en=%b q=%b",$time,clr,en,q);
		@(posedge clk);
		@(posedge clk);
		#1 clr=0;
		@(posedge clk);
		@(posedge clk);
		#1 en=1;
		repeat(12) @(posedge clk);
		#1 en=0;
		@(posedge clk);
		@(posedge clk);
		#1 en=1;
		@(posedge clk);
		#3 clr=1;
		#7 clr=0;
		repeat(3) @(posedge clk);
		#1 en=0;
		@(posedge clk);
		#1 report;
		#1 $finish;
	end

	always@(negedge clk)
	begin
		bit_cnt=0;
		for(i=0;i<10;i=i+1)
			if(q[i]==1'b1)
				bit_cnt=bit_cnt+1;
		if(bit_cnt!=1)
		begin
			error=error+1;
			$display("ERROR: q=%b is not one-hot at %0dns",q,$time);
		end
	end

	task report;
		begin
			if(error==0)
				$display("SIMULATION PASSED: clr, en and q all behave correctly");
			else
				$display("SIMULATION FAILED: %0d error(s)",error);
		end
	endtask
endmodule
