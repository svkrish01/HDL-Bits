/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//174. Testbench - Clock

module top_module ();
    
    reg clk;
    
    dut inst (.clk(clk));
    
    initial clk = 1'b0;
    
    always #5 clk = ~clk;

endmodule
