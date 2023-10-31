
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 14:32:15
// Design Name: 
// Module Name: RAM Module for ARM
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

module Memory(CEENZ,addr, data_in, data_out, wr_en, clk,R0,R1,R2,R3,R4,R5,R6,PC,CPC,rst,datacee,ambain,literal,csrc,call,ret,pop,push,LNK);
input CEENZ;
input [4:0] addr;
input [7:0] data_in;
input [7:0] datacee;
input [7:0] ambain;
input [7:0] literal;
input [1:0] csrc;
output [7:0] data_out;
output [7:0] R0;
output [7:0] R1;
output [7:0] R2;
output [7:0] R3;
output [7:0] R4;
output [7:0] R5;
output [7:0] R6;
output [7:0] PC;
input wr_en, clk;
input [1:0] CPC; // Control for Program Counter if CPC = 1 then PC++ if CPC =0  PC=PC
input rst;
input call;
input ret;
input pop;
input push;
output [7:0] LNK;

reg [7:0] Mem[0:31];
reg [7:0] internal_bus;
reg [7:0] REG0;
reg [7:0] REG1;
reg [7:0] REG2;
reg [7:0] REG3;
reg [7:0] REG4;
reg [7:0] REG5;
reg [7:0] REG6;
reg [7:0] PCREG;
reg [7:0] POPPUSHTEMP;
reg [7:0] lnkreg;


initial internal_bus = Mem[addr];	// initialize what's at the output

always@(negedge rst)
begin
   Mem[5'h1F] = 8'h00;   // Stack pointer
   Mem[5'h0C] = 8'hFF;   // Clears PC
   Mem[5'h1E] = 8'h00;   // Link Register
   Mem[5'h00] = 8'h00;   //R0
   Mem[5'h01] = 8'h00;   //R1
   Mem[5'h02] = 8'h00;   //R2
   Mem[5'h03] = 8'h00;   //R3
   Mem[5'h04] = 8'h00;   //R4
   Mem[5'h05] = 8'h00;   //R5
   Mem[5'h06] = 8'h00;   //R6
   Mem[5'h07] = 8'h00;   //R7
   Mem[5'h08] = 8'h00;   //R8
end

always @addr
         begin 
          internal_bus = Mem[addr];	// update what's at the output
          REG0 = Mem[5'h00]; // Update the Output for R0
          REG1 = Mem[5'h01]; // Update the Output for R1
          REG2 = Mem[5'h02]; // Update the Output for R2
          REG3 = Mem[5'h03]; // Update the Output for R4
          REG4 = Mem[5'h04]; // Update the Output for R4
          REG5 = Mem[5'h05]; // Update the Output for R2
          REG6 = Mem[5'h06]; // Update the Output for R4
          PCREG = Mem[5'h0C]; // Update the Output for PC
          lnkreg = Mem[5'h1E]; // Update Link
       end 
       
always @(posedge clk)
   if (wr_en == 1) 
   begin
       case(csrc)
        2'b00: Mem[addr] = data_in;
        2'b01: Mem[addr] = literal;
        2'b10: Mem[addr] = ambain;
        2'b11: Mem[addr] = datacee;           
       endcase
	   internal_bus = Mem[addr]; 	// update what's at the output
	   if(call)
	       begin
	       Mem[5'h0D] = PCREG;   // Saves PC prior value
	       PCREG = Mem[5'h0C]; // Update the Output for PC
	       Mem[5'h1E] = Mem[5'h0D]+1'b1;
	       end
	   if(ret)
               begin
               Mem[5'h0C] = Mem[5'h0D]; // Link -> PC
               PCREG = Mem[5'h1E]; // Update the Output for PC
               end
       if(pop)
               begin
               Mem[5'h1E] = Mem[addr]; // Link -> PC
               end
       if(push)
               begin
               Mem[addr]=Mem[5'h1E]; //  PC->Link
               end               
	   case(CPC)
	       2'd1: begin
                 PCREG=Mem[5'h0C];
                 Mem[5'h0C]=PCREG+1'b1;  // PC<- PC+1
                 PCREG=Mem[5'h0C];
                 end
           2'd2: begin 
                  if(CEENZ) 
                            begin
                               begin
                                 PCREG=Mem[5'h0C];
                                 Mem[5'h0C]=PCREG+1'b1;  // PC<- PC+1
                                 PCREG=Mem[5'h0C];
                               end
                             end
                   if(!CEENZ) 
                            begin
                                 begin
                                  PCREG=Mem[5'h0C];
                                  Mem[5'h0C]=PCREG+2'd2;  // PC<- PC+1
                                  PCREG=Mem[5'h0C];
                                 end
                             end
                  end
            endcase
       REG0 = Mem[5'h00]; // Update the Output for R0
       REG1 = Mem[5'h01]; // Update the Output for R1
       REG2 = Mem[5'h02]; // Update the Output for R2
       REG3 = Mem[5'h03]; // Update the Output for R4
       REG4 = Mem[5'h04]; // Update the Output for R4
       REG5 = Mem[5'h05]; // Update the Output for R2
       REG6 = Mem[5'h06]; // Update the Output for R4
       PCREG = Mem[5'h0C]; // Update the Output for PC
       lnkreg = Mem[5'h1E]; // Update Link   
	end

assign data_out = internal_bus;
assign R0 = REG0;
assign R1 = REG1;
assign R2 = REG2;
assign R3 = REG3;
assign R4 = REG4;
assign R5 = REG5;
assign R6 = REG6;
assign PC = PCREG;
assign LNK = lnkreg; 

endmodule
