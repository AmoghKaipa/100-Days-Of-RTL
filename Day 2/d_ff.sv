`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2022 11:48:00 AM
// Design Name: 
// Module Name: d_ff
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


module d_ff(input logic d_i,
 input wire clk,
  input wire reset,
   output logic q_no_rst,
    output logic q_syn_rst,
     output logic q_asyn_rst);

always_ff @(posedge clk) begin
    q_no_rst <= d_i;
end

always_ff @(posedge clk) begin
    if(reset) begin
        q_syn_rst <= 1'b0;
    end
    else begin
        q_syn_rst <= d_i;
    end
end

always_ff @(posedge clk or posedge reset) begin
    if(reset) begin
        q_asyn_rst <= 1'b0;
    end
    else begin
        q_asyn_rst <= d_i;
    end
end
endmodule
