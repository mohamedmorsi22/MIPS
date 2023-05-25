`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2023 04:53:04 PM
// Design Name: 
// Module Name: ALU_
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


module ALU_
    (
      input logic [2:0] ALU_control,
      input logic [31:0] src_a,src_b,
      output logic [31:0] ALU_result,
      output logic zero
    );
    
    
    logic [31:0] CLA_out;
    
    //carry look-ahead adder
    add_sub_32b instance_1 (.src_a(src_a),
                            .src_b(src_b),
                            .c_in(ALU_control[2]),
                            .sum(CLA_out),
                            .c_out());
    
    
    always_comb
    begin
    zero = 1'b0;
    ALU_result = 32'b0;
    case (ALU_control)
    3'b010:  ALU_result = CLA_out;  //add
    
    3'b110:   //sub
    begin
    ALU_result = CLA_out;  
    if (ALU_result == 0)
    zero = 1'b1;
    end
    
    3'b000:  ALU_result = src_a & src_b;  //AND
    3'b001:  ALU_result = src_a | src_b;  //OR
    
    3'b111:  
    ALU_result = (CLA_out[32])? src_b : src_a;  //slt
    default: ALU_result = 32'bx;
    endcase
    end
endmodule
