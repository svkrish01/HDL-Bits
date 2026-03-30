/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//166. Waveform Analysis - Combinational Circuit 3

module top_module 
    (
        input a, b,
        input c, d,
        output q 
    );

    assign q = (a | b) & (c | d);

endmodule
