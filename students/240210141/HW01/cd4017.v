module CD4017(clk, en, clr, q);
    input clk, en, clr;
    output[9:0] q;
    reg[3:0] count;

    always@(posedge clk)
    begin
        if(en)
            if(!clr)
                if(count == 4'd9)
                    count <= 4'd0;
                else
                    count <= count + 1'b1;
            else
                count <= 4'd0;
        else
            count <= count;
    end

    assign q = 10'b0000000001 << count;
endmodule
