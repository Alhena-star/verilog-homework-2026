`timescale 1ns/1ps

module cd4017(clk, en, clr, q);
    input clk, en, clr;
    output [9:0] q;
    reg [3:0] count;

    // High-level enable: en=1 counts; en=0 holds.
    // Active-high asynchronous clear: clr=1 resets to Q0.
    always @(posedge clk or posedge clr)
    begin
        if (clr)
            count <= 4'd0;
        else if (en)
        begin
            if (count == 4'd9)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end
    end

    assign q = 10'b0000_0000_01 << count;
endmodule
