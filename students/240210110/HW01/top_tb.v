module top_tb;
wire clk;
reg clr;
reg en;
wire [9:0] q;

clk_gen u_clk(clk);
cd4017 u_cd4017(clk,en,clr,q);

initial
begin
    $dumpfile("wave.vcd");   
    $dumpvars(0, top_tb);

    clr = 0;
    en = 0;

    #10  clr = 1;   
    #30  clr = 0;   

    #400;
    $finish;
end

endmodule