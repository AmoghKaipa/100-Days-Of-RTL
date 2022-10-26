`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 12:56:49 PM
// Design Name: 
// Module Name: day_6_tb
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


module day_6_tb;

logic clk = 1'b1; 
logic reset; 
logic d_in;
logic[3:0] op_state;

day_6 Day_6(.*);

always #5 clk = ~clk;

initial begin

    @(posedge clk);
    reset <= 1'b1;
    d_in <= 1'b0;
    @(posedge clk);
    reset <= 0;
    @(posedge clk);
    repeat(20) begin
        d_in = $random%2;
        @(posedge clk);
    end
    
end

endmodule
