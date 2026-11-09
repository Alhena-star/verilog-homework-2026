module cd4017(clk, en, clr, q);
input clk;
input en;
input clr;
output [9:0] q;
reg [9:0] q;

always @(posedge clk or posedge clr)
begin
    if (clr)
    begin
        q <= 10'b0000000001;
    end
    else if (en)
    begin
        case (q)
            10'b0000000001: q <= 10'b0000000010;
            10'b0000000010: q <= 10'b0000000100;
            10'b0000000100: q <= 10'b0000001000;
            10'b0000001000: q <= 10'b0000010000;
            10'b0000010000: q <= 10'b0000100000;
            10'b0000100000: q <= 10'b0001000000;
            10'b0001000000: q <= 10'b0010000000;
            10'b0010000000: q <= 10'b0100000000;
            10'b0100000000: q <= 10'b1000000000;
            10'b1000000000: q <= 10'b0000000001;
            default: q <= 10'b0000000001;
        endcase
    end
end
endmodule
