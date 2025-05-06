module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] cout_inst1, cout_inst2, cout_inst3;
    wire [15:0] sum_upper, sum_lower;
    add16 inst1 (a[15:0],  b[15:0],  1'b0, sum[15:0], cout_inst1);
    add16 inst2 (a[31:16], b[31:16], 1'b0, sum_upper, cout_inst2);
    add16 inst3 (a[31:16], b[31:16], 1'b1, sum_lower, cout_inst3);

    always @(*) begin
        case (cout_inst1)
            2'b00 : sum[31:16] = sum_upper;
            2'b01 : sum[31:16] = sum_lower;
        endcase
    end
endmodule