`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 07:52:13 AM
// Design Name: 
// Module Name: day_11_tb
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


module day_11_tb;

reg clk, reset;
reg x_i, det_o;

day_12 Day_12 (.*);

initial clk <=1'b0;

always #10 clk = ~clk;

logic [11:0] seq = 12'b1110_1101_1011;

initial begin

    @(posedge clk);
    reset = 1'b1;
    @(posedge clk);
    reset = 1'b0;
    for (int i=11; i>=0; i=i-1) begin
      x_i <= seq[i];
      @(posedge clk);
    end
    for (int i=0; i<12; i=i+1) begin
      x_i <= $random%2;
      @(posedge clk);
    end
    $finish();

end

endmodule
