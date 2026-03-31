/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//175. Testbench - Signals

module top_module 
    ( 
        output reg A, 
        output reg B 
    );

    initial begin
		A = 1'b0;
        #10 A = 1'b1;
        #10 A = 1'b0;
    end
    
    initial begin
        B = 1'b0;
        #15 B = 1'b1;
        #25 B = 1'b0;
    end

endmodule
