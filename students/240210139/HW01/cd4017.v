`timescale 1ns/1ps

module CD4017(clk, en, clr, q);
	input clk, en, clr;
	output[9:0] q;
	reg[3:0] count;

	// 仿真初值，避免上电瞬间输出为不确定态
	initial
	begin
		count = 4'b0000;
	end

	always@(posedge clk)
	begin
		if(clr)
			count <= 4'b0000;
		else if(en)
		begin
			if(count == 4'b1001)
				count <= 4'b0000;
			else
				count <= count + 1;
		end
	end

	// 十路译码输出，计数 0 时 q[0] 为高，逐位向后移动
	assign q = 10'b0000000001 << count;
endmodule
