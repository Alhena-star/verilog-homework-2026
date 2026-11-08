`timescale 1ns / 1ns

module cd4017(clk,en,clr,q);
	input clk;
	input en;
	input clr;
	output[9:0] q;
	reg[9:0] q;

	// clr 为高电平时异步清零，输出回到 Q0
	// en 为 1 时每个时钟上升沿左移一位，Q9 移回 Q0
	always@(posedge clk or posedge clr)
	begin
		if(clr)
			q<=10'b0000000001;
		else if(en)
			q<={q[8:0],q[9]};
	end
endmodule
