`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 10:38:51 AM
// Design Name: 
// Module Name: day_5_tb
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




module day_5_tb;

reg clk = 0;
reg reset;
logic [7:0] count_o;

day_5 Day_5 (.*);

always #5 clk = ~clk;

initial begin
    reset <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    for (int i=0; i<128; i++)
      @(posedge clk);
    $finish();
end

endmodule
