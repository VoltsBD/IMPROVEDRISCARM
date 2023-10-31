`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  DLSU Manila
// Engineer:  Voltaire B. Dupo, ECE, MSc. ECE
// 
// Create Date: 24.10.2023 16:08:11
// Design Name:  Virtual ARM Processor
// Module Name: VARM Tie Up
// Project Name:  Alternate Processor Project
// Target Devices:  None
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: No dependencies
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ARM(
    input wire rst,
    input wire [7:0] Lit,
    input wire [5:0] addr,
    input wire [7:0] datain,
    input wire wr_en,
    input wire clk,
    input wire [5:0] calu,
    input wire [1:0] cpc,
    input wire [1:0] csrc,
    input wire [2:0] cmsrc,
    output wire [7:0] dataout,
    output wire [7:0] R0,
    output wire [7:0] R4,
    output wire [7:0] PC,
    output wire [7:0] muxout,
    output wire [7:0] R1,
    output wire [7:0] R2,
    output wire [7:0] R3,
    output wire [7:0] R5,    
    output wire [7:0] R6,
    output wire [7:0] CEE,
    input wire call,
    input wire ret,
    input wire pop,
    input wire push,
    output wire [7:0] LNK,
    output wire CEENZ
    //output wire [7:0] MUXOUT
    );



ALU U1 (rst,R1,R2,Lit,calu,CEE);
Memory U2 (CEENZ,addr, datain, dataout, wr_en, clk,R0,R1,R2,R3,R4,R5,R6,PC,cpc,rst,CEE,muxout,Lit,csrc,call,ret,pop,push,LNK);
MUX U3 (cmsrc,R0,R1,R2,R3,R4,R5,R6,CEE,muxout);
Compare U4 (CEE,Lit,CEENZ);



/*
module MUX(
input wire [2:0] cmsrc,
input wire [7:0] R0,
input wire [7:0] R1,
input wire [7:0] R2,
input wire [7:0] R3,
input wire [7:0] R4,
input wire [7:0] R5,
input wire [7:0] R6,
input wire [7:0] MEMCEE,
output reg [7:0] muxout 
);
*/
    
endmodule
