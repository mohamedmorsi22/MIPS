`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 10:59:56 PM
// Design Name: 
// Module Name: asyn_ff
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


module asyn_ff
  #(parameter N=8)
   (
     input logic clk, rst_n,
     input logic [N-1:0] d,
     output logic [N-1:0] q
    );
    
    always_ff @(posedge clk, negedge rst_n)
    if (~rst_n)
    q <= 0;
    else
    q <= d;
endmodule
