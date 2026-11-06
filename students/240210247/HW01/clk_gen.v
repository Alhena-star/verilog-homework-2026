module clk_gen(clk);
    output clk;
    reg clk;

    initial clk = 1'b0;
    always #10 clk = ~clk;
endmodule
