/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//137. Serial Receiver with Parity

module top_module
    (
        input clk,
        input in,
        input reset,    
        output [7:0] out_byte,
        output done
    ); 
    
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3;
    parameter S4 = 3'd4, S5 = 3'd5, S6 = 3'd6;
    
    reg parity;
    reg [2:0] count;
    reg [2:0] state, next_state;    
    wire valid;

    always @(posedge clk) begin
        if(reset) begin
            next_state = S0;
        end
        
        else begin
            case(state) 
                S0 : next_state = (~in) ? S1 : S0;
                
                S1 : begin
                    next_state = S2;
                    out_byte[0] = in;
                    parity = in;
                    count[2:0] <= 3'd1;
                end
                
                S2 : begin
                    out_byte[count] = in;
                    parity <= parity ^ in;
                    
                    if(count < 7) next_state = S2;                    
                    else if(count == 7) next_state = S3;
                    
                    count <= count + 1;
                end
                
                S3 : begin
                    if(parity ^ in) valid = 1'b1;
                    else valid = 1'b0;
                    
                    next_state = S4;
                end
                
                S4 : next_state = (in) ? S5 : S6;
                S5 : next_state = (in) ? S0 : S1;
                S6 : next_state = (in) ? S0 : S6;
            endcase
        end
        
        state <= next_state;
    end        
    
    assign done = (valid == 1'b1) & (state == S5);

endmodule
