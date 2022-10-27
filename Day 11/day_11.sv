`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2022 08:31:00 AM
// Design Name: 
// Module Name: day_11
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module day_11(input logic [3:0] parallel_i,
              input logic clk,
              input logic reset,
              output logic serial_o,
              output logic empty_o,
              output logic valid_o
              );
          
logic [3:0] next_state, state;

logic [2:0] count_ff, next_count;


always_ff @(posedge clk or posedge reset) begin

    if(reset) begin
    
        state <= 4'h0;
        count_ff <= 3'h0;
    
    end
        
    else begin
        
        state <= next_state;
        count_ff <= next_count;
        
    end
    

end

    
    assign next_state = empty_o? parallel_i : {1'b0, state[3:1]};
    assign serial_o = state[0];
    
    assign next_count = (count_ff == 3'h4)? 3'h0 : count_ff + 3'h1; 
    assign valid_o = (count_ff>0)? 1:0;
    assign empty_o = (count_ff == 3'h0);
    

endmodule
