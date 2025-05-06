module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum_low;
    wire [15:0] sum_high;
    wire carry_out;

    add16 u1 ( .a(a[15:0]),  .b(b[15:0]),  .sum(sum_low),  .cin(1'b0),      .cout(carry_out) );
    add16 u2 ( .a(a[31:16]), .b(b[31:16]), .sum(sum_high), .cin(carry_out),                  );

    assign sum = {sum_high, sum_low};
endmodule