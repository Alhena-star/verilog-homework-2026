module top_tb;
reg en;
reg clr;
wire clk;
wire [9:0] q;


clk_gen u_clk_inst(
    .clk(clk)
);


cd4017 u_cd4017_inst(
    .clk(clk),
    .en(en),
    .clr(clr),
    .q(q)
);


initial begin
    en  = 1'b0;
    clr = 1'b1;
    #10 clr = 1'b0;  //10ns后撤销清零
    #30 en  = 1'b1;  //使能打开，开始计数
    #200 en  = 1'b0; //关闭使能，停止计数
    #50 $finish;     //结束仿真
end

//导出波形文件，用来看波形
initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, top_tb);
end
endmodule