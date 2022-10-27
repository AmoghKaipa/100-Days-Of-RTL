`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 10:43:51 AM
// Design Name: 
// Module Name: day_9_tb\
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


module day_9_tb;

parameter vec_len = 4;
logic[vec_len - 1 : 0] bin_i; 
logic[vec_len - 1 : 0] gray_o;

day_9 #(vec_len) Day_9 (.*);

initial begin

    for (int i = 0; i < 2**vec_len; i = i + 1) begin
    
        bin_i = $urandom_range(0, vec_len-1);
        #10;
    
    end
    

end

endmodule
