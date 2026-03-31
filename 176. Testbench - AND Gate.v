/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//176. Testbench - AND Gate

module top_module();
    
    reg [1:0] in;
    wire out;
    
    andgate Test (.in(in), .out(out));
    
    initial begin
        in[1:0] = 2'b0;
        #10 in[1:0] = 2'b01;
        #10 in[1:0] = 2'b10;
        #10 in[1:0] = 2'b11;
    end

endmodule
