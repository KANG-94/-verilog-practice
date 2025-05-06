module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

    wire cout_inst1, cout_inst2;
    wire [31:0]b_to_xor;
    
    add16 inst1 (a[15:0],  b_to_xor[15:0],  sub,        sum[15:0],  cout_inst1);
    add16 inst2 (a[31:16], b_to_xor[31:16], cout_inst1, sum[31:16], cout_inst2);
    assign b_to_xor = {32{sub}}^b;
     
endmodule
