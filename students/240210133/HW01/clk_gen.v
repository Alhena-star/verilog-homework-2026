`timescale 1ns/1ps
module clk_gen(clk);
output clk;
reg clk;
initial
	clk=0;
always
	#10 clk=~clk;
endmodule
