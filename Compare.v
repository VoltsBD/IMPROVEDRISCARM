`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLSU Manila
// Engineer: Voltaire B. Dupo
// 
// Create Date: 31.10.2023 21:11:07
// Design Name: RISC ARM Processor Comparison Module
// Module Name: Compare
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


module Compare(CEE,Lit,CEENZ);
    
    
    input wire [7:0] CEE;
    input wire [7:0] Lit;
    output reg CEENZ;

    
    always@(*)
    begin

    if(CEE==Lit) 
            begin
            CEENZ=1'b1;
            end
    else 
            begin
            CEENZ=1'b0;
            end

    end
          
endmodule
