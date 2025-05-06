module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = { {24{in[7]}}, in }; // ex) 반복 bit[7]를 24번
    
endmodule