/*
Developer   - Sriram Venkata Krishna
Date        - 28-02-2026
Platform    - HDL Bits
*/

//155. FSM - Enable Shift Register

module top_module 
    (
        input clk,
        input reset,     
        output shift_ena
    );
    
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2;
    parameter S3 = 3'd3, S4 = 3'd4;
    
    reg [2:0] state, next_state;
    
    always @(posedge clk) begin
        if(reset) begin
            next_state = S4;
        end
        
        else begin
            case(state)
                S4 : next_state = S3;
                S3 : next_state = S2;
                S2 : next_state = S1;
                S1 : next_state = S0;
                S0 : next_state = S0;
            endcase
        end
        
        state <= next_state;
    end
    
    assign shift_ena = (state > 0);

endmodule
