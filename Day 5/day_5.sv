`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:35:25 AM
// Design Name: 
// Module Name: day_5
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


module day_5(input reg clk, input reg reset, output logic[7:0] count_o);


logic[7:0] next_count;

always_ff @(posedge clk or posedge reset) 
    if (reset) begin
        count_o <= 8'h1;
    end
    else begin
        count_o <= next_count;
    end


assign next_count = count_o + 8'h2;

endmodule
