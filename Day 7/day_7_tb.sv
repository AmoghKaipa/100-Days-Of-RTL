`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 04:28:00 PM
// Design Name: 
// Module Name: day_7_tb
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


module day_7_tb;

logic clk = 1'b1;
logic reset = 1'b1;
logic [3:0] lfsr_o;

day_7 Day_t(.*);

always #5 clk = ~clk;

initial begin
    
    @(posedge clk);
    reset <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    
    repeat(50) begin
        @(posedge clk);
    end
        
end

endmodule
