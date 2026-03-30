/*
Developer   - Sriram Venkata Krishna
Date        - 31-03-2026
Platform    - HDL Bits
*/

//179. CS450 - Timer

module top_module
    (
        input clk, 
        input load, 
        input [9:0] data, 
        output tc
    );
    
    reg [9:0] counter;
    
    always @(posedge clk) begin
        if(load) begin
            counter[9:0] <= data[9:0];
        end
        
        else if(counter[9:0] > 10'd0) begin
            counter = counter - 1;
        end
    end
    
    assign tc = (counter[9:0] == 10'd0);

endmodule
