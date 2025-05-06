module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] sum_low;
    wire [31:16] sum_high;
    wire carry_out;
    
    add16 inst1 ( .a(a[15:0]),  .b(b[15:0]),  .cin(1'b0),      .sum(sum_low), .cout(carry_out) );
    add16 inst2 ( .a(a[31:16]), .b(b[31:16]), .cin(carry_out), .sum(sum_high),                 );
    
    assign sum = {sum_high, sum_low};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
    
	assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule