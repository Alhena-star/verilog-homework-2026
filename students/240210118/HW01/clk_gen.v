module clk_gen(clk);
output reg clk;
initial begin
    clk = 0;
    forever #10 clk = ~clk; // 周期20，高低电平各10
end
endmodule