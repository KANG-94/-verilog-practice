module top_module (); //강명균_Verilog_실습
    reg clk=0;
    reg reset;
    reg in=0; //in 초기화
    wire out;
    
    always #5 clk = ~clk; //주기 10의 클럭
    
    kang_practice inst (.clk(clk), .reset(reset), .in(in), .out(out)); //아래의 모듈(kang_practice)을 인스턴스화
    
    initial begin
        `probe_start;
        reset = 1; #5; // state을 잠시 A로 만들어 output을 0으로 초기화
        reset = 0; #5;
        in = 1; #10
        in = 0; #10
        in = 1; #10
        in = 1; #10 // 첫번째 1011
                
        in = 1; #10
        in = 1; #10
        in = 0; #10
        in = 0; #10 // 다른 값 입력
        
        in = 1; #10
        in = 0; #10
        in = 1; #10
        in = 1; #10
        in = 0; #10
        in = 1; #10
        in = 1; #10 // 두번째 1011

        $finish;
    end

    `probe(clk);
    `probe(reset);
    `probe(in);
    `probe(out);
endmodule

module kang_practice (
    input clk,         // 클럭
    input reset,       // 리셋
    input in,          // 입력
    output reg out     // 출력 - 1011 감지 시 1을 출력
);

    parameter A = 3'b000; // 초기 상태 (아무것도 감지되지 않음)
    parameter B = 3'b001; // '1' 감지
    parameter C = 3'b010; // '10' 감지
    parameter D = 3'b011; // '101' 감지

    reg [2:0] state, next_state; 

    // 상태 전이 조합 논리
    always @(*) begin
        case (state)
            A: next_state = (in == 1) ? B : A;
            B: next_state = (in == 0) ? C : B;
            C: next_state = (in == 1) ? D : A;
            D: next_state = (in == 1) ? B : C; // 겹침 허용
            default: next_state = A;
        endcase
    end

    // 상태 갱신
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    // Mealy 방식 출력 (상태 == D이고 입력 == 1이면 out = 1)
    always @(*) begin
        if (state == D && in == 1)
            out = 1;
        else
            out = 0;
    end

endmodule