module top_tb;
     wire clk;
     clk_gen u_clk(clk);
     reg en;
     reg clr;
     wire [9:0] q;
     cd4017 u_cd4017(clk,en,clr,q);
     initial
     begin
         $dumpfile("done");
         $dumpvars();
         clr = 1;
         en = 1;
         #20
         clr = 0;
         en = 0;
         #220
         en = 1;
         #30
         clr = 1;
         #20
         $finish();
     end
 endmodule