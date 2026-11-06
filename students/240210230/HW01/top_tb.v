module top_tb;
wire clk;
reg en;       // ✅ 重点！reg！不是wire
reg cr;       // ✅ 重点！reg！不是wire
wire [9:0] q;

// 例化时钟
clk_gen u_clk(
    .clk(clk)
);

// 例化cd4017
cd4017 u_cd4017(
    .clk(clk),
    .en(en),
    .cr(cr),
    .q(q)
);

// 导出波形
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end

initial begin
    cr = 1'b1;
    en = 1'b0;
    #20 cr = 1'b0;
    en = 1'b1;
    #300 $finish;
end

initial begin
    $monitor("time=%0t, clk=%b, en=%b, cr=%b, q=%b",$time,clk,en,cr,q);
end

endmodule

