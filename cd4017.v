module cd4017(
    input        clk,
    input        en,
    input        clr,
    output reg [9:0] q
);

always@(posedge clk or posedge clr) begin
    if(clr) begin
        q <= 10'b0000000001;  //清零后第0位为1
    end
    else if(en) begin
        if(q == 10'b1000000000)
            q <= 10'b0000000001;
        else
            q <= q << 1;
    end
end
endmodule