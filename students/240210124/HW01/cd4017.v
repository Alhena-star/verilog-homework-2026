module CD4017(clk, en, clr, q);

input        clk;
input        en;
input        clr;
output [9:0] q;

reg    [9:0] q;
reg    [3:0] count;

always @(posedge clk or posedge clr)
begin
    if(clr)
        count <= 4'd0;
    else if(en)
        count <= count + 1'b1;
end

always @(*)
begin
    case(count)
        4'd0: q = 10'b0000000001;
        4'd1: q = 10'b0000000010;
        4'd2: q = 10'b0000000100;
        4'd3: q = 10'b0000001000;
        4'd4: q = 10'b0000010000;
        4'd5: q = 10'b0000100000;
        4'd6: q = 10'b0001000000;
        4'd7: q = 10'b0010000000;
        4'd8: q = 10'b0100000000;
        4'd9: q = 10'b1000000000;
        default: q = 10'b0000000001;
    endcase
end

endmodule