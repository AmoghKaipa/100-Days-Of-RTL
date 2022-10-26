`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 12:55:47 PM
// Design Name: 
// Module Name: day_6
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


module day_6(input logic d_in, input logic reset, input logic clk, output logic[3:0] op_state);

    logic [3:0] next_state, state;
    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= 4'b0;
        else
            state <= next_state;
    end
    
    assign next_state = {state[2:0], d_in};
    assign op_state = state;
    
endmodule
