`timescale 1ns/1ps
module CD4017(clk, en, clr, q);
    input clk, en, clr;
    output [9:0] q;
    reg [3:0] count;

    always @(posedge clk or posedge clr)
    begin
        if (clr)
            count <= 0;
        else if (en)
        begin
            if (count == 9)
                count <= 0;
            else
                count <= count + 1;
        end
    end

    assign q = 10'b0000000001 << count;

endmodule
