/*
Developer   - Sriram Venkata Krishna
Date        - 06-03-2026
Platform    - HDL Bits
*/

//161. Bugs in Code - Multiplexer 2

module top_module 
    (
        input [1:0] sel,
        input [7:0] a,
        input [7:0] b,
        input [7:0] c,
        input [7:0] d,
        output [7:0] out  
    ); 

    wire [7:0] line0, line1;
    
    mux2 mux0( sel[0], a[7:0], b[7:0], line0[7:0]);
    mux2 mux1( sel[0], c[7:0], d[7:0], line1[7:0]);
    mux2 mux2( sel[1], line0[7:0], line1[7:0], out[7:0]);

endmodule
