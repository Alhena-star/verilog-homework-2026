module cd4017(clk, en, clr, q);
    input clk, en, clr;
    output [9:0] q;
    reg [3:0] count;
    reg [9:0] q_reg;

    always @(posedge clk) begin
        if(en) begin
            if(!clr) begin
                if(count == 4'd9)
                    count <= 4'd0;
                else
                    count <= count + 1'd1;
            end
            else begin
                count <= 4'd0;
            end
        end
        else begin
            count <= count;
        end
    end

    always @(*) begin
        case(count)
            4'd0: q_reg = 10'b0000000001;
            4'd1: q_reg = 10'b0000000010;
            4'd2: q_reg = 10'b0000000100;
            4'd3: q_reg = 10'b0000001000;
            4'd4: q_reg = 10'b0000010000;
            4'd5: q_reg = 10'b0000100000;
            4'd6: q_reg = 10'b0001000000;
            4'd7: q_reg = 10'b0010000000;
            4'd8: q_reg = 10'b0100000000;
            4'd9: q_reg = 10'b1000000000;
            default: q_reg = 10'b0000000001;
        endcase
    end

    assign q = q_reg;

endmodule
