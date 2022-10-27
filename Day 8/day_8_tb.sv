`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2022 10:04:25 AM
// Design Name: 
// Module Name: day_8_tb
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


module day_8_tb;

    logic [3:0] bin_i;
    logic [15:0] one_hot_o;
    
    day_8 Day_8(.*);
    
    initial begin
    
        repeat(32) begin
        
            bin_i = $urandom_range(0, 15);
            #10;
            
        end
    
    end
    
    initial begin
    
        #200;
        $finish;
    
    end
    
    

endmodule
