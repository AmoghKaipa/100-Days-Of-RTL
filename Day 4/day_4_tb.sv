`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 09:41:30 AM
// Design Name: 
// Module Name: day_4_tb
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


module day_4_tb;

logic [7:0] a = 8'b0;
logic [7:0] b = 8'b0;
logic [2:0] alu_mode = 3'b0;
logic [7:0] alu_op = 8'b0;

day_4 Day_4(.*);


initial begin

    repeat(20) begin
        
        alu_mode = $urandom_range(0, 3'b111);
        a = $urandom_range(0, 8'hFF);
        b = $urandom_range(0, 8'hFF);
        #20;
        
    end
    
end 



endmodule
