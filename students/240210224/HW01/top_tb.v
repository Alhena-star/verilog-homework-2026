`timescale 1ns/1ps

module top_tb;

wire clk;
wire rst_n;
reg en;
reg clr;
wire [9:0] q;

clk_gen u_clk_gen(
    .clk(clk),
    .rst_n(rst_n)
);

cd4017 u_cd4017(
    .clk(clk),
    .en(en),
    .clr(clr),
    .q(q)
);

initial begin
    en = 1'b0;
    clr = 1'b0;

    @(posedge rst_n);
    #100;

    en = 1'b1;
    #50;

    en = 1'b0;
    #100;

    clr = 1'b1;
    #20;
    clr = 1'b0;
    #100;

    $finish;
end

endmodule
