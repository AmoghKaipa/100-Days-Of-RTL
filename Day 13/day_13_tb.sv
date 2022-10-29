`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 09:07:17 AM
// Design Name: 
// Module Name: day_13_tb
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


module day_13_tb;
logic[3:0] a_i;
logic[3:0] sel_i;
logic     y_ter_o;
logic     y_case_o;
logic     y_ifelse_o;
logic     y_loop_o;
logic     y_aor_o;
logic [1:0] random;

day_13 Day_13(.*);
initial begin
    
    repeat (10) begin
        sel_i = 4'h0;
        random = $urandom_range(0,3);
        a_i = $urandom_range(0,15);
        sel_i[random] = 1;
        #20;
    end
    $finish;
    
end
endmodule
