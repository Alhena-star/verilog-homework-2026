module cd4017(
    input clk,
    input en,
    input cr,
    output reg [9:0] q
);
reg [3:0] cnt;
always @(posedge clk or posedge cr)begin
    if(cr)begin
        cnt <= 4'd0;
        q <= 10'b0000000001;
    end
    else if(en)begin
        if(cnt == 4'd9)begin
            cnt <= 4'd0;
            q <= 10'b0000000001;
        end
        else begin
            cnt <= cnt + 4'd1;
            q <= q << 1'b1;
        end
    end
end
endmodule

