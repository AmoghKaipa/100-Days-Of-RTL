`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 04:27:12 PM
// Design Name: 
// Module Name: day_7
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


module day_7(input logic clk, input logic reset, output logic[3:0] lfsr_o);

logic [3:0] state, next_state;

always_ff @(posedge clk or posedge reset) begin

    if(reset) 
        state <= 4'h2;
    else
        state <= next_state;

end

assign next_state = {state[2:0], state[1] ^ state[3]};
assign lfsr_o = state;

endmodule
