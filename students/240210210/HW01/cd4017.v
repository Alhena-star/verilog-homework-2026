`timescale 1ns / 1ps
module cd4017(clk, en, clr, q);
    input clk;
    input en;
    input clr;
    output [9:0] q;

    reg [3:0] count;
    assign q = 10'b0000000001 << count;

    always @(posedge clk or posedge clr)
    begin
        if (clr)
            count <= 4'd0;
        else if (!en)
        begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 1'b1;
        end
    end
endmodule
