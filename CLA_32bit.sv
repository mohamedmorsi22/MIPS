`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 02:30:54 PM
// Design Name: 
// Module Name: CLA_32bit
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


module CLA_32bit
    (
     input logic [31:0] src_a,src_b,
     input logic c_in,
     output logic [31:0] sum,
     output logic c_out
    );
    
    localparam N = 8;
    logic [N:0] carry;
    
    assign carry[0] = c_in;
    assign c_out = carry[N];
    
    cla_nbit cla1 (.a(src_a[3:0]),.b(src_b[3:0]),.c_in(carry[0]),.sum(sum[3:0]),.c_out(carry[1]));
    cla_nbit cla2 (.a(src_a[7:4]),.b(src_b[7:4]),.c_in(carry[1]),.sum(sum[7:4]),.c_out(carry[2]));
    cla_nbit cla3 (.a(src_a[11:8]),.b(src_b[11:8]),.c_in(carry[2]),.sum(sum[11:8]),.c_out(carry[3]));
    cla_nbit cla4 (.a(src_a[15:12]),.b(src_b[15:12]),.c_in(carry[3]),.sum(sum[15:12]),.c_out(carry[4]));
    cla_nbit cla5 (.a(src_a[19:16]),.b(src_b[19:16]),.c_in(carry[4]),.sum(sum[19:16]),.c_out(carry[5]));
    cla_nbit cla6 (.a(src_a[23:20]),.b(src_b[23:20]),.c_in(carry[5]),.sum(sum[23:20]),.c_out(carry[6]));
    cla_nbit cla7 (.a(src_a[27:24]),.b(src_b[27:24]),.c_in(carry[6]),.sum(sum[27:24]),.c_out(carry[7]));
    cla_nbit cla8 (.a(src_a[31:28]),.b(src_b[31:28]),.c_in(carry[7]),.sum(sum[31:28]),.c_out(carry[8]));
                   

endmodule
