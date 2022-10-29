`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 07:51:44 AM
// Design Name: 
// Module Name: day_12
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

//Design and verify a sequence detector to detect the following sequence: 1110_1101_1011
// Overlapping sequences should be detected
// The module should have the following interface:

module day_12(input     wire        clk,
              input     wire        reset,
              input     wire        x_i, //serial input
              output    wire        det_o // Output asserted when sequence is detected
             );
             
always @(posedge clk or posedge reset) begin

    

end             

endmodule
