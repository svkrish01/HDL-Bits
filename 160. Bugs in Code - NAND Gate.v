/*
Developer   - Sriram Venkata Krishna
Date        - 05-03-2026
Platform    - HDL Bits
*/

//160. Bugs in Code - NAND Gate

module top_module 
    (
        input a, 
        input b, 
        input c, 
        output out
    );

    wire out_n;
    
    andgate inst1(out_n, a, b, c, 1'b1, 1'b1);
    
    assign out = ~out_n;

endmodule
