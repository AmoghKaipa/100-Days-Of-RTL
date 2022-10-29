`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2022 09:06:50 AM
// Design Name: 
// Module Name: day_13
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

//Design a 2:1 mux using the following language constructs:
/*
Ternary Operator
Case statement
If else block
Combinatorial For loop
And-or tree
*/

module day_13(input     logic[3:0] a_i,
              input     logic[3:0] sel_i,

              // Output using ternary operator
              output    logic     y_ter_o,
              // Output using case
              output    logic     y_case_o,
              // Ouput using if-else
              output    logic     y_ifelse_o,
              // Output using for loop
              output    logic     y_loop_o,
              // Output using and-or tree
              output    logic     y_aor_o
              );
assign y_ter_o = sel_i[0] ? a_i[0] :
                 sel_i[1] ? a_i[1] :
                 sel_i[2] ? a_i[2] :
                            a_i[3] ;
                 
always_comb begin
    case (sel_i)
        4'b0001 : y_case_o = a_i[0];
        4'b0010 : y_case_o = a_i[1];
        4'b0100 : y_case_o = a_i[2];
        4'b1000 : y_case_o = a_i[3];
        default : y_case_o = 1'bx;
    endcase
end

always_comb begin
    if (sel_i == 4'b0001)  y_ifelse_o = a_i[0];
    else if (sel_i == 4'b0010)  y_ifelse_o = a_i[1];
    else if (sel_i == 4'b0100)  y_ifelse_o = a_i[2];
    else if (sel_i == 4'b1000)  y_ifelse_o = a_i[3];
    else y_ifelse_o = 1'bx;
end

always_comb begin
    y_loop_o = 1'b0;
    for (int i = 0; i<4; i++) begin
        y_loop_o = (sel_i[i] & a_i[i]) | y_loop_o;
    end
end

assign y_aor_o = (a_i[0] & sel_i[0] |
                  a_i[1] & sel_i[1] |
                  a_i[2] & sel_i[2] |
                  a_i[3] & sel_i[3]);

endmodule
