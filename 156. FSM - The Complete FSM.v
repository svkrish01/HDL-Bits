/*
Developer   - Sriram Venkata Krishna
Date        - 28-02-2026
Platform    - HDL Bits
*/

//156. FSM - The Complete FSM

module top_module 
    (
        input clk,
        input reset,      
        input data,
        output shift_ena,
        output counting,
        input done_counting,
        output done,
        input ack 
    );
    
    parameter S0 = 4'd0, S1 = 4'd1, S2 = 4'd2;
    parameter S3 = 4'd3, S4 = 4'd4, S5 = 4'd5;
    parameter S6 = 4'd6, S7 = 4'd7, S8 = 4'd8;
    parameter S9 = 4'd9;
    
    reg [3:0] state, next_state;
    
    always @(posedge clk) begin
        if(reset) begin
            next_state = S0;
        end
        
        else begin
            case(state)
                S0 : next_state = (data) ? S1 : S0;
                S1 : next_state = (data) ? S2 : S0;
                S2 : next_state = (data) ? S2 : S3;
                S3 : next_state = (data) ? S4 : S0;
                S4 : next_state = S5;
                S5 : next_state = S6;
                S6 : next_state = S7;
                S7 : next_state = S8;
                S8 : next_state = (done_counting) ? S9 : S8;
                S9 : next_state = (ack) ? S0 : S9;
            endcase
        end
        
        state <= next_state;
    end
    
    assign shift_ena = (state >= S4) & (state <= S7);
    assign counting = (state == S8);
    assign done = (state == S9);
    
endmodule
