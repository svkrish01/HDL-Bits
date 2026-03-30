/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//164. Waveform Analysis - Combinational Circuit 1

module top_module 
    (
        input a,
        input b,
        output q 
    );

    assign q = a & b; 

endmodule
