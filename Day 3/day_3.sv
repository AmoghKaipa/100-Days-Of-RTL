`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 10:10:33 PM
// Design Name: 
// Module Name: day_3
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


module day_3(
    input wire clk,
    input wire d_in,
    input wire reset,
    output wire pos_edge,
    output wire neg_edge
    );
    logic d_delayed;
    always_ff @(posedge clk or posedge reset) begin
        if(reset) begin
            d_delayed <= 1'b0;
        end
        else begin
            d_delayed <= d_in;
        end
    end
    
    assign pos_edge = d_in & ~d_delayed;
    assign neg_edge = ~d_in & d_delayed;
    
endmodule
