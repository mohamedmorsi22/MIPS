`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2023 03:00:48 PM
// Design Name: 
// Module Name: controller
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


module controller
    (
     input logic [5:0] opcode,
     input logic [5:0] func,
     output logic [2:0] ALU_control,
     input logic zero,
     output logic MEMwrite,
                  REGwrite,
                  ALUsrc,
                  REGdist,
                  MEMtoREG,
                  Jump,
                  Branch
    );
    
    logic [1:0] ALU_op;
    
    
    main_decoder MD (.ALUop(ALU_op),
                     .opcode(opcode),
                     .MEMwrite(MEMwrite),
                     .REGwrite(REGwrite),
                     .ALUsrc(ALUsrc),
                     .REGdist(REGdist),
                     .MEMtoREG(MEMtoREG),
                     .Jump(Jump),
                     .Branch(Branch));
                     
    ALU_decoder ALU_DEC (.ALU_op(ALU_op),
                         .func(func),
                         .ALU_control(ALU_control));                 
endmodule
