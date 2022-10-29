`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 05:32:44 PM
// Design Name: 
// Module Name: day_14_tb
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


module day_14_tb;
parameter no_of_ports = 4;
logic[3:0] req_i;
logic[3:0] gnt_o;

day_14 Day_14(.*);

initial begin
    repeat(20) begin
        req_i = $urandom_range(0,15);
        #20;
    end
    $finish;
end
endmodule
