module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );

    assign w = {a, b[4:2]};  //w는 b의 일부만(4~2)out
    assign x = {b[1:0], c, d[4]}; //나머지도 비슷한 방식으로 연결됨.
    assign y = {d[3:0], e[4:1]};
    assign z = {e[0], f, 2'b11};

endmodule