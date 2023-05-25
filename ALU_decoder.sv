`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2023 02:46:15 PM
// Design Name: 
// Module Name: ALU_decoder
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


module ALU_decoder
   (
     input logic [1:0] ALU_op,
     input logic [5:0] func,
     output logic [2:0] ALU_control
    );
    
    always_comb
    begin
    case ({ALU_op,func})
    8'b00101010: ALU_control = 3'b010;  // for LW and SW and addi
    8'b01101010: ALU_control = 3'b110;  // for beq
    8'b10100000: ALU_control = 3'b010; // add
    8'b10100010: ALU_control = 3'b110; // sub
    8'b10100100: ALU_control = 3'b000; // and
    8'b10100101: ALU_control = 3'b001; // or
    8'b10101010: ALU_control = 3'b111; // slt
    default: ALU_control = 3'bxxx; // ???
    endcase
    end
endmodule
