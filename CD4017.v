module CD4017(clk,en,clr,q);
		input clk,en,clr;
		output[9:0] q;
		reg[9:0] q;
		always@(posedge clk or posedge clr) begin
				if(clr) begin
						q <= 10'b0000000001;
				end
				else if(en) begin
						if(q == 10'b1000000000) begin
							q <= 10'b0000000001;
				end
				else begin
							q <= q << 1;
				end
		end
end
endmodule