/*
Developer   - Sriram Venkata Krishna
Date        - 04-03-2026
Platform    - HDL Bits
*/

//150. 2A - FSM 2

module top_module 
    (
        input clk,
        input resetn,   
        input [3:1] r,   
        output [3:1] g  
    ); 
    
    parameter S0 = 2'd0, S1 = 2'd1;
    parameter S2 = 2'd2, S3 = 2'd3;
    
    reg [1:0] state, next_state;
    
    always @(posedge clk) begin
        if(~resetn) begin
            next_state = S0;
        end
        
        else begin
            case(state)
                S0 : begin
                    if(r[1]) next_state = S1;
                    else if(r[2]) next_state = S2;
                    else if(r[3]) next_state = S3;
                    else next_state = S0;
                end
                
                S1 : next_state = (r[1]) ? S1 : S0;
                S2 : next_state = (r[2]) ? S2 : S0;
                S3 : next_state = (r[3]) ? S3 : S0;
            endcase
        end
        
        state <= next_state;
    end
    
    assign g[1] = (state == S1);
    assign g[2] = (state == S2);
    assign g[3] = (state == S3);                   

endmodule
