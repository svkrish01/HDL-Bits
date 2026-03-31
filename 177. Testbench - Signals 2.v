/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//177. Testbench - Signals 2

module top_module();
    
    reg clk, in;
    reg [2:0] s;
    wire out;
    
    q7 Test (.clk(clk), .in(in), .s(s), .out(out));
    
    initial clk = 1'b0;
    
    always #5 clk = ~clk;
    
    initial begin
        in = 1'b0;
        #20 in = 1'b1;
        #10 in = 1'b0;
        #10 in = 1'b1;
        #30 in = 1'b0;
    end
    
    initial begin
        s[2:0] = 3'd2;
        #10 s[2:0] = 3'd6;
        #10 s[2:0] = 3'd2;
        #10 s[2:0] = 3'd7;
        #10 s[2:0] = 3'd0;
    end

endmodule
