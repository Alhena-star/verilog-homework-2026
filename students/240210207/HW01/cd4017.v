module CD4017(clk,clr,en,q);
	input clk,clr,en;
	output [9:0] q;

	reg [9:0] q;
	reg [3:0] count;
	always@(posedge clk)
	begin
		if(clr)
		begin
			count<=4'b0000;
			q<=10'b0000000001;
		end
		else if (en)
		begin
			if(count == 4'b1001)
			begin
				count <=4'b0000;
				q <= 10'b0000000001;
			end
			else
			begin
				count <= count + 4'b0001;
				q <= q << 1;
			end
		end
	end
endmodule