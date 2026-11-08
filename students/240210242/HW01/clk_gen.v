// clk_gen.v
// Clock generator used by the HW01 testbench.
// The half period is PERIOD/2, so one full clock cycle is PERIOD ns.

`timescale 1ns/1ps

module clk_gen(clk);

    output clk;

    reg    clk;

    parameter PERIOD = 20;

    initial begin
        clk = 1'b0;
    end

    always begin
        #(PERIOD / 2) clk = ~clk;
    end

endmodule
