`timescale 1ns / 1ps

module cd4017(clk, clr, en, q);
  input clk;
  input clr;
  input en;
  output [9:0] q;
  reg [9:0] q;

  always @(posedge clk or posedge clr)
  begin
    if (clr == 1'b1)
      q <= 10'b0000000001;
    else if (en == 1'b1)
      q <= {q[8:0], q[9]};
  end

endmodule
