module top_tb;
wire clk;
wire [9:0] q;
reg en;
reg clr;

clk_gen u_clk(.clk(clk));
CD4017 u_cd4017(.clk(clk), .en(en), .clr(clr), .q(q));

initial begin
    $dumpfile("sim.vcd");
    $dumpvars(0, top_tb);

    clr = 1'b1;
    en  = 1'b0;
    #20;
    clr = 1'b0;
    en  = 1'b1;
    #400;
    $finish;
end
endmodule
