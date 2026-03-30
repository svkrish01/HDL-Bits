/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//173. Waveform Analysis - Sequential Circuit 10

module top_module 
    (
        input clk,
        input a,
        input b,
        output q,
        output state  
    );
    
    always @(posedge clk) begin
        if(a & b) begin
            state <= 1;
        end
        
        else if(~(a | b) & q) begin
            state <= 0;
        end
    end
    
    always @(*) begin
        q = (a ^ b ^ state);
    end

endmodule
