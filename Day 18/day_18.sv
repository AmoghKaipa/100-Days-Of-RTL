`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2022 07:11:29 PM
// Design Name: 
// Module Name: day_18
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


/*
This is the APB slave design which uses the Valid / Ready memory interface created on Day 17.
*/
module day_18(
  input         wire        clk,
  input         wire        reset,

  input         wire        psel_i,
  input         wire        penable_i,
  input         wire[9:0]   paddr_i,
  input         wire        pwrite_i,
  input         wire[31:0]  pwdata_i,
  output        wire[31:0]  prdata_o,
  output        wire        pready_o
);

logic apb_valid = psel_i & penable_i;

day_17 Day17(.clk(clk),
             .reset(reset),
             .req_i(apb_valid),
             .req_rnw_i(~pwrite_i),
             .req_addr_i(paddr_i),
             .req_wdata_i(pwdata_i),
             .req_ready_o(pready_o),
             .req_rdata_o(prdata_o));
endmodule
