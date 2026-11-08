module cd4017(
    input clk,
    input clr,    // 清零，高有效
    input en,     // 使能，低有效（CD4017 INH）
    output reg [9:0] q
);
reg [3:0] cnt;

always @(posedge clk or posedge clr) begin
    if (clr) begin
        cnt <= 4'd0;
        q <= 10'b0000000001;
    end
    else if (!en) begin
        case(cnt)
            4'd0: q <= 10'b0000000001;
            4'd1: q <= 10'b0000000010;
            4'd2: q <= 10'b0000000100;
            4'd3: q <= 10'b0000001000;
            4'd4: q <= 10'b0000010000;
            4'd5: q <= 10'b0001000000;
            4'd6: q <= 10'b0010000000;
            4'd7: q <= 10'b0100000000;
            4'd8: q <= 10'b1000000000;
            4'd9: q <= 10'b0000000001;
        endcase
        cnt <= (cnt == 4'd9) ? 4'd0 : cnt + 1'b1;
    end
end
endmodule
