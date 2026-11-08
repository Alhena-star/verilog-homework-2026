`timescale 1ns / 1ns

module top_tb;
	wire clk;
	reg en;
	reg clr;
	wire[9:0] q;

	// 实例化时钟模块和被测模块
	clk_gen u_clk_gen(clk);
	cd4017 u_cd4017(clk,en,clr,q);

	initial
	begin
		$dumpfile("report.vcd");
		$dumpvars();

		en=1;
		clr=1;
		#25 clr=0;		// 释放清零，开始计数
		#180 en=0;		// 关闭使能，观察计数保持
		#70 en=1;		// 重新使能，继续计数
		#70 clr=1;		// 计数过程中异步清零
		#20 clr=0;
		#50 $finish;
	end
endmodule
