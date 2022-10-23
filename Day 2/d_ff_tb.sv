`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 11:53:24 AM
// Design Name: 
// Module Name: d_ff_tb
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


module d_ff_tb;

reg clk = 1;
reg reset = 0;
logic q_no_rst, q_syn_rst, q_asyn_rst, d_i;

d_ff uut(.*);
always #20 clk = ~clk;

initial begin
    d_i = 1'b1;;
    #30;
    reset = 1;
    d_i = 1'b1;
    #20;
    d_i = 1'b1;
    reset = 0;
    #10;
    reset = 1'b1;
end

initial begin
    #200;
    $finish;
end

    
endmodule
