/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//180. CS450 - Directional Counter

module top_module
    (
        input clk,
        input areset,
        input train_valid,
        input train_taken,
        output [1:0] state
    );
    
    always @(posedge clk or posedge areset) begin
        if(areset) begin
            state[1:0] <= 2'b01;
        end
        
        else if(train_valid) begin
            if(train_taken & (state[1:0] < 2'd3)) begin
                state <= state + 1;
            end
            
            else if(~train_taken & (state[1:0] > 2'd0)) begin
                state <= state - 1;
            end
        end
    end

endmodule
