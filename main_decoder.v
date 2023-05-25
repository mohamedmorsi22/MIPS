`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2023 02:05:52 PM
// Design Name: 
// Module Name: main_decoder
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


module main_decoder
    (
      input logic [5:0]opcode,
      output logic [1:0] ALUop,
      output logic MEMwrite,
                   REGwrite,
                   ALUsrc,
                   REGdist,
                   MEMtoREG,
                   Branch,
                   Jump
    );
    
    localparam [5:0] R_type = 6'b000000,
                     LW = 6'b100011,
                     SW = 6'b101011,
                     BEQ = 6'b000100,
                     ADDI = 6'b001000,
                     J = 6'b000010;
    
    logic [8:0] control;
    assign {ALUop,MEMwrite,REGwrite,ALUsrc,REGdist,MEMtoREG,Branch,Jump} = control;
    
    
    always_comb
    begin
    case (opcode)
    R_type: control = 9'b100101000;
    LW: control = 9'b000110100;
    SW: control = 9'b001010000;
    BEQ: control = 9'b010000010;
    ADDI: control = 9'b000110000;
    J: control = 9'b000000001;
    default: control = 9'bxxxxxxxxx;
    endcase
    end
endmodule
