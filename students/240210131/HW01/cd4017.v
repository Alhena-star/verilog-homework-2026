module CD4017(clk, en, clr, q);
	input	clk,en,clr;

	output	[9:0]	q;
	reg	[9:0]	q;
	reg	[3:0]	count;

	always@(posedge clk or posedge clr)
	begin
		if(clr)
		begin
			count <= 4'd0;
			q <= 10'b0000000001;
		end
		else if(en)
		begin
			if(count == 4'd9)
			begin
				count <= 4'd0;
				q <= 10'b0000000001;
			end
			else
			begin
				count <= count + 4'd1;
				q <= q << 1;
			end
		end
	end
endmodule
