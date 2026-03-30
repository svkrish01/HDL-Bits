/*
Developer   - Sriram Venkata Krishna
Date        - 30-03-2026
Platform    - HDL Bits
*/

//168. Waveform Analysis - Combinational Circuit 5

module top_module 
    (
        input [3:0] a,
        input [3:0] b,
        input [3:0] c,
        input [3:0] d,
        input [3:0] e,
        output [3:0] q 
    );
    
    always @(*) begin
        case (c[3:0]) 
            4'd0 : q[3:0] = b[3:0];
            4'd1 : q[3:0] = e[3:0];
            4'd2 : q[3:0] = a[3:0];
            4'd3 : q[3:0] = d[3:0];
            
            default : q[3:0] = 4'hf;
        endcase
    end

endmodule
