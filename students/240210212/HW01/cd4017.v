module CD4017(clk,en,clr,q);
	input clk,en,clr;
	output [9:0] q;
	reg [3:0] count;
	initial count=0;
	always@(posedge clk)
	begin
	if(en)
	if(!clr)
	count<=count+1;
	else
	count<=0;
	else
	count<=count;
	end
	assign q=10`b1<<count;
endmodule