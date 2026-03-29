/*
Developer   - Sriram Venkata Krishna
Date        - 29-03-2026
Platform    - HDL Bits
*/

//162. Bugs in Code - Adder Subtractor

module top_module 
    ( 
        input do_sub,
        input [7:0] a,
        input [7:0] b,
        output reg [7:0] out,
        output reg result_is_zero
    );

    always @(*) begin
        case (do_sub)
            0: out = a+b;
            1: out = a-b;
        endcase 

        result_is_zero = ~(| out[7:0]);
    end

endmodule
