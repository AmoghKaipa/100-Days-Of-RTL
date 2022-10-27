`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 10:03:52 AM
// Design Name: 
// Module Name: day_8
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


module day_8( input logic [3:0] bin_i, output logic [15:0] one_hot_o);


always_comb begin

    assign one_hot_o = 1'b1 << bin_i;
    
end
endmodule