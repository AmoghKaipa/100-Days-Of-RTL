`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 10:43:25 AM
// Design Name: 
// Module Name: day_9
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


module day_9 #(parameter vec_len = 4)(input wire[vec_len - 1 : 0] bin_i, output wire[vec_len - 1 : 0] gray_o);



    assign gray_o[vec_len - 1] = bin_i[vec_len - 1];
    
    genvar i;// A genvar is a variable used in generate-for loop. No need of initial begin block while using genvar
    for (i = vec_len - 2; i >= 0; i = i-1) 
        assign gray_o[i] = bin_i[i+1] ^ bin_i[i]; 
    
    

    

endmodule
