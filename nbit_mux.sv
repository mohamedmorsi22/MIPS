`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 04:57:41 PM
// Design Name: 
// Module Name: nbit_mux
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


module nbit_mux
   #(parameter N=4)
    (
      input logic [N-1:0] A,B,
      input logic sel,
      output logic [N-1:0] out
    );
    
    assign out = (sel)? B : A;
endmodule
