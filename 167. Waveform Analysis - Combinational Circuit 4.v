/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//167. Waveform Analysis - Combinational Circuit 4

module top_module 
    (
        input a, b,
        input c, d,
        output q 
    );

    assign q = (b | c);

endmodule
