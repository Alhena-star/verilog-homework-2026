module cd4017(clk,en,clr,q);
input clk,en,clr;
output reg [9:0] q;
reg [3:0] cnt;

always @(posedge clk or posedge clr)
begin
    if(clr)
        cnt=4'd0;
    else if(en)
    begin
        if(cnt==4'd9)
            cnt=4'd0;
        else
            cnt=cnt+4'd1;
    end
end

always @(*)
begin
    case(cnt)
        4'd0: q = 10'b0000000001;
        4'd1: q = 10'b0000000010;
        4'd2: q = 10'b0000000100;
        4'd3: q = 10'b0000001000;
        4'd4: q = 10'b0000010000;
        4'd5: q = 10'b000100000;
        4'd6: q = 10'b001000000;
        4'd7: q = 10'b010000000;
        4'd8: q = 10'b100000000;
        4'd9: q = 10'b0000000001;
        default: q = 10'b0000000001;
    endcase
end

endmodule
