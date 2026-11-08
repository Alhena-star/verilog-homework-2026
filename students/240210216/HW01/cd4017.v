`timescale 1ns/1ps
module CD4017(clk, en, clr, q);
		input clk, en, clr;
		output[9:0] q;
		reg[3:0] count;

		assign q = 10'b1 << count;

		always@(posedge clk or posedge clr)
		begin
			if(clr)
				count <= 4'd0;
			else if(en)
				begin
					if(count == 4'd9)
						count <= 4'd0;
					else
						count <= count + 1;
				end
		end
endmodule

