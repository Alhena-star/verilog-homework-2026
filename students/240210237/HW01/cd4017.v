module CD4017(clk, en, clr, q);
	input clk, en, clr;
	output[9:0] q;
	reg[3:0] count;
	always@(posedge clk or posedge clr)
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
	assign q = 10'b0000000001 << count;
endmodule
