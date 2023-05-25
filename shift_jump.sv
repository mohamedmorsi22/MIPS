`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 10:53:44 PM
// Design Name: 
// Module Name: shift_jump
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


module shift_jump
   (
     input logic [25:0] j,
     output logic [27:0] shifted_j
    );
    
    assign shifted_j = {j,2'b00};
    
endmodule
