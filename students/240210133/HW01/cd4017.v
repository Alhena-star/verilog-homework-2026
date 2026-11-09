`timescale 1ns/1ps
module CD4017(clk,en,clr,q);
input clk;
input en;
input clr;
output[9:0] q;
reg[9:0] q;
always @(posedge clk or posedge clr)
begin
	if(clr)
		q<=10'b0000000001;
	else if(en)
		begin
			if(q==10'b1000000000)
				q<=10'b0000000001;
			else
				q<=q<<1;
		end
end
endmodule
