/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//172. Waveform Analysis - Sequential Circuit 9

module top_module 
    (
        input clk,
        input a,
        output [3:0] q 
    );
    
    always @(posedge clk) begin
        if(a) begin
            q <= 4'd4;
        end
        
        else begin 
            if(q[3:0] == 4'd6) begin
                q <= 4'd0;
            end
            
            else begin
                q <= q + 1;
            end
        end
    end          

endmodule
