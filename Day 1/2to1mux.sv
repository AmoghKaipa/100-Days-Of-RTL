`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 10:07:00 AM
// Design Name: 
// Module Name: 2to1mux
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


module mux2to1(input wire s, input wire [7:0] a, input wire [7:0] b, output wire [7:0] y);

assign y = s ? a : b;

endmodule
