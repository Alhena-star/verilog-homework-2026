`timescale 1ns / 1ps

module clk_gen(clk);
  parameter PERIOD = 10;
  output clk;
  reg clk;

  initial clk = 1'b0;
  always #(PERIOD / 2) clk = ~clk;

endmodule
