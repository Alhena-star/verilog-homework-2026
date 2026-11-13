module clk_gen(
    output reg clk,
    output reg rst_n
);

initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial begin
    rst_n = 1'b0;
    #20 rst_n = 1'b1;
end

endmodule
