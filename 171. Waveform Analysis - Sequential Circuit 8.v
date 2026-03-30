/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//171. Waveform Analysis - Sequential Circuit 8

module top_module 
    (
        input clock,
        input a,
        output p,
        output q 
    );
    
    initial q = 0;
    
    always @(*) begin
        if (clock) begin
            p = a;
        end
    end
    
    always @(negedge clock) begin
        q <= a;
    end

endmodule
