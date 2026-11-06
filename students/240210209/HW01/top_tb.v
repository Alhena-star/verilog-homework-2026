//======================================================================
//  top_tb.v  --  test bench for the CD4017 decade counter
//
//  instantiates clk_gen (classroom version) and cd4017, then
//    1. releases clr and counts a full decade  Q0 .. Q9 -> Q0
//    2. pulls en low  -> the counter must hold its state
//    3. raises clr between two clock edges -> asynchronous clear
//
//  Verilog-1995 coding style, no ANSI port list.
//======================================================================
module top_tb;

	wire        clk;
	reg         en;
	reg         clr;
	wire [9:0]  q;

	// clock generator, 20 ns period (10 ns high / 10 ns low)
	clk_gen u_clk_gen (clk);

	// device under test
	cd4017  u_cd4017  (clk, en, clr, q);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars(0, top_tb);

		$display("");
		$display("  time   clr  en   q[9:0]");
		$display("  ------------------------------------");

		en  = 1;
		clr = 1;

		#15  clr = 0;		// t=15   release the asynchronous clear
		#235 en  = 0;		// t=250  stop counting, hold the state
		#60  en  = 1;		// t=310  count again
		#45  clr = 1;		// t=355  clear in the middle of a high phase
		#10  clr = 0;		// t=365  release the clear
		#55  $finish;		// t=420  end of simulation
	end

	// state on every rising edge, printed after the non-blocking update
	always @(posedge clk)
		$strobe("  %4t    %b    %b    %b", $time, clr, en, q);

	// the asynchronous clear does not need a clock edge
	always @(q)
		if (clr)
			$display("  %4t    %b    %b    %b   <-- clear to Q0",
			         $time, clr, en, q);

endmodule
