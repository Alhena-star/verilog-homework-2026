`timescale 1ns/1ps

module top_tb;

reg en;
reg clr;
wire clk;
wire [9:0] q;

clk_gen u_clk_gen(
    clk
);

cd4017 u_cd4017(
    clk,
    en,
    clr,
    q
);

initial begin
    en = 1'b0;
    clr = 1'b0;

    #10;
    clr = 1'b1;
    #10;
    clr = 1'b0;
    #10;

    en = 1'b1;
    #100;

    en = 1'b0;
    #30;

    en = 1'b1;
    #100;

    clr = 1'b1;
    #10;
    clr = 1'b0;
    #20;

    $stop;
end

endmodule
