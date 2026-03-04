/*
Developer   - Sriram Venkata Krishna
Date        - 04-03-2026
Platform    - HDL Bits
*/

//148. 2A - FSM

module top_module 
    (
        input clk,
        input reset,
        input w,
        output z
    );
    
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2;
    parameter S3 = 3'd3, S4 = 3'd4, S5 = 3'd5;
    
    reg [2:0] state, next_state;
    
    always @(*) begin
        if(reset) begin
            next_state = S0;
        end
        
        else begin
            case(state)
                S0 : next_state = (w) ? S1 : S0;
                S1 : next_state = (w) ? S2 : S3;
                S2 : next_state = (w) ? S4 : S3;
                S3 : next_state = (w) ? S5 : S0;
                S4 : next_state = (w) ? S4 : S3;
                S5 : next_state = (w) ? S2 : S3;
            endcase
        end
    end
    
    always @(posedge clk) begin
        state <= next_state;
    end
    
    assign z = (state >= S4);          

endmodule
