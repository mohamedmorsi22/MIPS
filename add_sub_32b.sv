`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 04:34:20 PM
// Design Name: 
// Module Name: add_sub_32b
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


module add_sub_32b
    (
      input logic [31:0] src_a,src_b,
      input logic c_in,
      output logic [31:0] sum,
      output logic c_out
    );
    
    logic [31:0] xored_b;
    assign xored_b = src_b ^ {32{c_in}};
    
    CLA_32bit AS (.src_a(src_a),
                  .src_b(xored_b),
                  .c_in(c_in),
                  .sum(sum),
                  .c_out());
endmodule
