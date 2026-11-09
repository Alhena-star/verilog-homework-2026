 module top_tb;
wire clk;
reg clr;
reg en;
wire [9:0] q;

clk_gen u_clk(clk);
cd4017 u_cd4017(clk,en,clr,q);

initial
begin
    $dumpfile("wave.vcd");   //导出波形文件
    $dumpvars(0, top_tb);

    clr = 0;
    en = 0;

    #10  clr = 1;   //上电复位
    #30  clr = 0;   //撤销复位，开始计数

    #400;
    $finish;
end

endmodule