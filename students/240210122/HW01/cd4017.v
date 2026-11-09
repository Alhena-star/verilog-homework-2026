module cd4017(clk, en, clr, q);
	input clk, en, clr;
	output reg [9:0] q;

	always @(posedge clk or posedge clr)
	begin
		if(clr)
			q <= 10'b0000000001;
		else if(en)
			q <= {q[8:0], q[9]};
	end
endmodule
