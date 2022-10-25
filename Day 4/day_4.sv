`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2022 09:32:01 AM
// Design Name: 
// Module Name: day_4
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


module day_4(input logic [7:0] a,
             input logic [7:0] b,
             input logic [2:0] alu_mode,
             output logic [7:0] alu_op
             );
             
always_comb begin


    case (alu_mode)
    
        3'b000: alu_op = a + b;
        3'b001: alu_op = a - b;
        3'b010: alu_op = a <<< b[2:0];
        3'b011: alu_op = a >>> b[2:0];
        3'b100: alu_op = a & b;
        3'b101: alu_op = a | b;
        3'b110: alu_op = a ^ b;
        3'b111: alu_op = a == b;
        default: $display("Invalid input");
        
    endcase
    
end

    

endmodule
