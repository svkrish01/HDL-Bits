/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//165. Waveform Analysis - Combinational Circuit 2

module top_module 
    (
        input a, b,
        input c, d,
        output q 
    );

    assign q = ~(a ^ b ^ c ^ d); 

endmodule
