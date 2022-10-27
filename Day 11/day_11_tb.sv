`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/27/2022 08:31:37 AM
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


logic clk = 1'b0;
logic reset;
logic serial_o;
logic empty_o;
logic valid_o;
logic [3:0] parallel_i;

day_11 Day_11(.*);

always #5 clk = ~clk;

initial begin

    @(posedge clk);
    reset <= 1'b1;
    @(posedge clk);
    @(posedge clk);
    reset <= 1'b0;
    repeat (32) begin
    
        parallel_i = $urandom_range(0,4'hF);
        @(posedge clk);
    
    end
    
    

end


endmodule
