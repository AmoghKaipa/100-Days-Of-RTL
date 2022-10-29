`timescale 1ns / 1ps

//Design and verify a 4-bit round robin arbiter.

/*
About Arbiter:
An Arbiter provides or grants access to the Resource when there are multiple requests. It can be of 2 types:
1. Priority Arbiter
2. Round Robin Arbiter
Priority Arbiter grants access of the resource to the request having the highest priority.
Round Robin Arbiter grants access of the resource to all the requests in a cyclic fashion unless priority arbiter. 
*/


module day_15_tb(
                input     wire        clk,
                input     wire        reset,
                input     wire[3:0]   req_i,
                output    logic[3:0]  gnt_o
                );
                


endmodule




