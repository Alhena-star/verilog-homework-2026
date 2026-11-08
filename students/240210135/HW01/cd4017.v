module CD4017(
    input        clk,
    input        en,
    input        clr,
    output reg [9:0] q
);

always @(posedge clk) begin
    if(clr == 1'b1) begin
        q <= 10'b0000000000;
    end
    else if(en == 1'b1) begin
        if(q == 10'b1000000000) begin
            q <= 10'b0000000001;
        end
        else begin
            q <= q << 1'b1;
        end
    end
end

endmodule
