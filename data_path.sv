`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 11:06:26 PM
// Design Name: 
// Module Name: data_path
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


module data_path
    (
      input clk,rst_n,
      input logic [31:0] instr,
      input logic [2:0] ALU_control,
      input logic [31:0] read_data,
      output logic [31:0] write_data,
      output logic [31:0] ALU_result,
      output logic [31:0] PC,
      output logic zero,
      input logic REGwrite,
                  ALUsrc,
                  REGdist,
                  MEMtoREG,
                  PCsrc,
                  Jump    
     );
     
     logic [31:0] rd_data1;
     logic [31:0] sign_extended;
     logic [4:0] wr_addr;
     logic [31:0] result;

     //ALU path
     logic [31:0] src_b;    // output of the multiplexer
     sign_ext instance1 (.a(instr[15:0]),.extended_a(sign_extended));
     nbit_mux #(.N(32)) instance2 (.A(write_data),.B(sign_extended),.sel(ALUsrc),.out(src_b));
     ALU_ instance3 (.ALU_control(ALU_control),.src_a(rd_data1),.src_b(src_b),.zero(zero),.ALU_result(ALU_result));
     
     
     // register path
     nbit_mux #(.N(5)) instance4 (.A(instr[20:16]),.B(instr[15:11]),.sel(REGdist),.out(wr_addr));
     nbit_mux #(.N(32)) instance5 (.A(ALU_result),.B(read_data),.sel(MEMtoREG),.out(result));
     reg_file instance6 (.clk(clk),
               .wr_en(REGwrite),
               .rd_addr1(instr[25:21]),
               .rd_addr2(instr[20:16]),
               .wr_addr(wr_addr),
               .out_data1(rd_data1),
               .out_data2(write_data),
               .in_data(result));
               
               
       // PC update
       logic [31:0] PC_plus4,PC_branch;
       logic [31:0] shifted_pc,PC_1,PC_next;
       CLA_32bit instance7 (.src_a(PC),.src_b(32'b100),.c_in(1'b0),.sum(PC_plus4),.c_out()); 
       shift_lf instance8 (.a(sign_extended),.shifted_a(shifted_pc)); 
       CLA_32bit instance9 (.src_a(PC_plus4),.src_b(shifted_pc),.c_in(1'b0),.sum(PC_branch),.c_out());
       nbit_mux #(.N(32)) instance10 (.A(PC_plus4),.B(PC_branch),.sel(PCsrc),.out(PC_1));
       nbit_mux #(.N(32)) instance11 (.A(PC_1),.B({PC_plus4[31:28],instr[25:0],2'b00}),.sel(Jump),.out(PC_next));
       asyn_ff #(.N(32)) instance12 (.clk(clk),.rst_n(rst_n),.d(PC_next),.q(PC));

endmodule
