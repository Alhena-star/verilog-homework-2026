module top_tb;
	wire clk;
	clk_gen u_clk(clk);
	reg en;
	reg clr;
	wire [9:0] q;
	cd4017 u_cd4017(clk,en,clr,q);
	initial
	begin
   		$dumpfile("wave.vcd");
   		$dumpvars(0,top_tb);
    	clr=1;
   		en=0;
   		#20 clr=0;
  	 	#20 en=1;
    	#200 clr=1;
    	#20 clr=0;
    	#200 $finish;
	end
endmodule
