module top_module ( 
    input a, 
    input b, 
    output out
);
    mod_a inst1 (.in1(a), .in2(b), .out(out) ); //module mod_a는 생략
endmodule
