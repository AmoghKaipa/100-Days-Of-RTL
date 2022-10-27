`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 02:35:57 PM
// Design Name: 
// Module Name: day_10_tb
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


module day_10_tb;


logic clk = 0;
logic reset = 1;;
logic load_i = 0;
logic[3:0] load_data_i = 4'h0;
logic[3:0] count_o;

day_10 Day_10(.*);

always #5 clk = ~clk;

initial begin

    @(posedge clk);
    reset <= 1'b1;
    @(posedge clk);
    reset <= 1'b0;
    
    repeat(13) begin
    
        @(posedge clk);
    
    end
    
    @(posedge clk);
    load_i <= 1'b1;
    load_data_i <= 4'h8;
    @(posedge clk);
    load_i <= 1'b0;
    //load_data_i <= 4'h0;
    
    repeat(10) @(posedge clk);
end

endmodule
