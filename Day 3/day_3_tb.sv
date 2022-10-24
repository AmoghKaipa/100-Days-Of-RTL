`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 10:16:14 PM
// Design Name: 
// Module Name: day_3_tb
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


module day_3_tb();

    logic clk = 1;
    logic reset = 0;
    logic d_in = 1'b1;
    logic pos_edge;
    logic neg_edge;
    
    day_3 Day_3(.*);
    
    always #10 clk = ~clk;
    
    initial begin
        @(posedge clk);
        reset <= 1'b1;
        @(posedge clk);
        d_in <= 1'b1;
        @(posedge clk);
        reset <= 1'b0;
        @(posedge clk);
        
        repeat(80) begin
            d_in <= $random%2;
            @(posedge clk);
        end
        
    end
    
    initial begin 
        #1000;
        $finish;
    end
endmodule
