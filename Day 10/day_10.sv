`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 02:35:14 PM
// Design Name: 
// Module Name: day_10
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


module day_10( input logic clk,
               input logic reset,
               input logic load_i,
               input logic[3:0] load_data_i,
               output logic[3:0] count_o
               );
               
logic[3:0] next_state;
logic[3:0] state;
always_ff @(posedge clk or posedge reset or load_i) begin

    if(reset)
        state <=4'h0;
    else if(load_i)
        state <= load_data_i;
    else
        state <= next_state;

end


assign next_state = load_i ? load_data_i : (state == 4'hF)? load_data_i : state + 1;
assign count_o = state;

endmodule
