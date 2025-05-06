module top_module( 
    input [7:0] in,
    output [7:0] out
);
//    assign out[7] = in[0];
//    assign out[6] = in[1];
//    assign out[5] = in[2];
//    assign out[4] = in[3];
//    assign out[3] = in[4];
//    assign out[2] = in[5];
//    assign out[1] = in[6];
//    assign out[0] = in[7]; .....too many line
//    assign {out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]} = in; ..too simple 
    always @(*) begin
        for (int i=0; i<8; i++)
            out[i] = in[8-i-1];
    end
endmodule