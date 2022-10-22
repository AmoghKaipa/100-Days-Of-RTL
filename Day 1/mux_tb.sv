`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2022 10:13:05 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
logic s;
logic [7:0] a, b, y;
mux2to1 day1 (.*);

initial begin
    for (int i =0; i<=10; i++) begin
        a = $urandom_range(0, 8'hFF);
        b = $urandom_range(0, 8'hFF);
        s = $random%2;
        #10;
    end
end

endmodule
