module cd4017(clk,en,clr,q);
	input clk,en,clr;
	output reg [9:0] q;
	reg[3:0] count;
	always@(posedge clk)
	begin
	if(clr) begin
	 count<=4'd0;
	end
	else begin
	 if(count==4'd9)
	  count<=4'd0;
	 else
	  count<=count+1;
	end
end
always@(*)begin
	q=10'b0000000000;
	case(count)
	 4'd0:q[0]=1'b1;
	 4'd1:q[1]=1'b1;
	 4'd2:q[2]=1'b1;
	 4'd3:q[3]=1'b1;
	 4'd4:q[4]=1'b1;
	 4'd5:q[5]=1'b1;
	 4'd6:q[6]=1'b1;
	 4'd7:q[7]=1'b1;
	 4'd8:q[8]=1'b1;
	 4'd9:q[9]=1'b1;
	endcase
end
endmodule
