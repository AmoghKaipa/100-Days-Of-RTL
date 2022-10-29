`timescale 1ns / 1ps

/*
About Priority Arbiter.
An Arbiter provides or grants access to the Resource when there are multiple requests. It can be of 2 types:
1. Priority Arbiter
2. Round Robin Arbiter
Priority Arbiter grants access of the resource to the request having the highest priority.
*/
module day_14 #(parameter no_of_ports = 4)(
               input       wire[no_of_ports-1:0] req_i,
               output      wire[no_of_ports-1:0] gnt_o   // One-hot grant signal
               );
               
assign gnt_o[0] = req_i[0]; // req_i[0] has the highest priority

genvar i;
for(i = 1; i < no_of_ports; i = i+1) begin
    assign gnt_o[i] = req_i[i] & ~(|req_i[i-1:0]); // | is a reduction or operator Ex. |(1001) = 1|0|0|1 = 1
end 
endmodule
