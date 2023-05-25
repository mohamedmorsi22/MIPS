`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2023 09:16:42 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file
    (
     input logic clk,
     input logic [4:0] rd_addr1,rd_addr2,
     input logic [4:0] wr_addr,
     input logic wr_en,
     input logic [31:0] in_data,
     output logic [31:0] out_data1,out_data2
    );
    
    logic [31:0] reg_file [0:31];
    
    always_ff @(posedge clk)
    if (wr_en)
    reg_file[wr_addr] <= in_data;
    
    // address 0 is hardwired to 0
    assign out_data1 = (rd_addr1 == 0)? 0 : reg_file[rd_addr1];
    assign out_data2 = (rd_addr2 == 0)? 0 : reg_file[rd_addr2];

    
endmodule
