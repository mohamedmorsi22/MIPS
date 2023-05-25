`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 09:01:08 PM
// Design Name: 
// Module Name: shift_lf
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


module shift_lf
    (
     input logic [31:0] a,
     output logic [31:0] shifted_a
    );
    
    assign shifted_a = {a[29:0],2'b00};
endmodule
