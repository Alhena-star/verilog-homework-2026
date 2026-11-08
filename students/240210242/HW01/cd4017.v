// cd4017.v
// Decade counter with 10 decoded outputs, modelled after the CD4017.
// clr is an asynchronous active-high clear, en is an active-high count enable.
// Only one bit of q is high at a time (one-hot), starting from q[0].

`timescale 1ns/1ps

module cd4017(clk, clr, en, q);

    input        clk;
    input        clr;
    input        en;

    output [9:0] q;

    reg    [9:0] q;

    always @(posedge clk or posedge clr) begin
        if (clr == 1'b1)
            q <= 10'b0000000001;
        else if (en == 1'b1)
            q <= {q[8:0], q[9]};
    end

endmodule
