/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//178. Testbench - T Flip-Flop

module top_module ();
    
    reg clk, reset, t;
    wire q;
    
    tff Test (.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial clk = 1'b0;
    
    always #5 clk = ~clk;
    
    initial begin
        reset = 1'b0;
        #2 reset = 1'b1;
        #10 reset = 1'b0;
    end
    
    initial begin 
        t = 1'b0;
        #12 t = 1'b1;
    end

endmodule
