`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLSU Manila
// Engineer:  Voltaire B. Dupo, ECE
// 
// Create Date: 17.10.2023 14:32:15
// Design Name: Basic MUX for R0-R6
// Module Name: MUX for Memory Operations MOV Rx,Ry
// Project Name:  RISC ARM Project
// Target Devices: 
// Tool Versions: Vivado 2018.1
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module MUX(cmsrc,R0,R1,R2,R3,R4,R5,R6,MEMCEE,muxout);

input wire [2:0] cmsrc;
input wire [7:0] R0;
input wire [7:0] R1;
input wire [7:0] R2;
input wire [7:0] R3;
input wire [7:0] R4;
input wire [7:0] R5;
input wire [7:0] R6;
input wire [7:0] MEMCEE;
output reg [7:0] muxout;

reg [7:0] muxy;

always@(*)
begin
    case(cmsrc)
     3'h0: muxy=R0;
     3'h1: muxy=R1;
     3'h2: muxy=R2;
     3'h3: muxy=R3;
     3'h4: muxy=R4;
     3'h5: muxy=R5;
     3'h6: muxy=R6;
     3'h7: muxy=MEMCEE;
     endcase


muxout = muxy;

end
      
endmodule
