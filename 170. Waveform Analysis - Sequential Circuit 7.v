/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//170. Waveform Analysis - Sequential Circuit 7

module top_module 
    (
        input clk,
        input a,
        output q 
    );
    
    always @(posedge clk) begin
        q = ~a;
    end

endmodule
