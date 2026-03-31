/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//157. The Complete Timer

module top_module 
    (
        input clk,
        input reset,     
        input data,
        output [3:0] count,
        output counting,
        output done,
        input ack 
    );
    
    parameter S0 = 3'd0, S1 = 3'd1, S2 = 3'd2, S3 = 3'd3;
    parameter S4 = 3'd4, S5 = 3'd5, S6 = 3'd6;
    
    reg [13:0] century_counter;
    reg [2:0] state, next_state;
    reg [1:0] counter;
    
    always @(posedge clk) begin
        if(reset) begin
            next_state = S0;
        end
        
        else begin
            case(state) 
                S0 : next_state = (data) ? S1 : S0;
                S1 : next_state = (data) ? S2 : S0;
                S2 : next_state = (data) ? S2 : S3;
                
                S3 : begin
                    if(data) begin
                        next_state = S4;
                        counter <= 2'd0;
                    end
                    
                    else begin 
                        next_state = S0;
                    end
                end
                    
                S4 : begin
                    if(counter < 2'd3) begin
                        count[3:0] <= {count[2:0], data};
                        counter <= counter + 1;
                    end
                    
                    else if(counter == 2'd3) begin
                        count[3:0] <= {count[2:0], data};
                        century_counter[13:0] = 14'd1000;
                        next_state = S5;
                    end
                end
                    
                S5 : begin 
                    if(century_counter[13:0] > 14'd1) begin
                        century_counter <= century_counter - 1;
                    end
                    
                    else if(century_counter[13:0] == 14'd1) begin
                        if(count[3:0] > 4'd0) begin
                            count <= count - 1;
                            century_counter[13:0] = 14'd1000;
                        end
                        
                        else begin
                            next_state = S6;
                        end
                    end
                end
                    
                S6 : next_state = (ack) ? S0 : S6;
            endcase
        end
            
        state <= next_state;
    end
        
    assign counting = (state == S5);
    assign done = (state == S6);

endmodule
