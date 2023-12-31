`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: DLSU Manila
// Engineer: Voltaire Dupo
// 
// Create Date: 25.10.2023 08:26:44
// Design Name: VBD ARM Test Bench
// Module Name: armtb
// Project Name: RISC Processor Basic
// Target Devices: 
// Tool Versions: Vivado 2018.1 Compiled
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module armtb;

reg einttb; 
reg rsttb;
reg [7:0] Literaltb;
reg [5:0] Addrtb;
reg [7:0] dataintb;
reg [7:0] AMBItb;
reg wr_entb;
reg clktb;
reg [5:0] calutb;
reg [1:0] cpctb;
reg [1:0] csrctb;
reg [2:0] cmsrctb;
wire [7:0] dataouttb;
wire [7:0] R0tb;
wire [7:0] R4tb;
wire [7:0] PCtb;
wire [7:0] muxouttb;
wire [7:0] R1tb;
wire [7:0] R2tb;
wire [7:0] R3tb;
wire [7:0] R5tb;
wire [7:0] R6tb;
wire [7:0] CEEtb;
reg caltb;
reg rettb;
reg poptb;
reg pushtb;
wire [7:0] LNKtb;
wire [7:0] stacktb;
wire CEENZtb;
reg [7:0] ambaintb;

ARM UUT (einttb,rsttb,Literaltb,Addrtb,dataintb,wr_entb,clktb,calutb,cpctb,csrctb,cmsrctb,dataouttb,R0tb,R4tb,PCtb,muxouttb,R1tb,R2tb,R3tb,R5tb,R6tb,CEEtb,caltb,rettb,poptb,pushtb,LNKtb,CEENZtb,ambaintb,stacktb);

initial 
begin
clktb=1'b0; // Clock Start Position
rsttb=1'b0; // Reset Signal
#5 einttb=1'b0; rsttb=1'b1; Literaltb=8'h00; Addrtb=8'h03; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1; cpctb=1'b1; dataintb=8'h11; AMBItb=8'h33; caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; ambaintb=8'h33;
#5 csrctb=2'h0;
#5 csrctb=2'h1;
#5 csrctb=2'h2;
#5 csrctb=2'h3;
end

always #5 clktb=~clktb;

initial
begin
#40	Literaltb=8'h00; Addrtb=8'h01; calutb=8'h00; csrctb=2'h0; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //IN R1
#10	Literaltb=8'h2B; Addrtb=8'h02; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //LOAD R2,43
#10	Literaltb=8'h42; Addrtb=8'h04; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //LOAD R4,66
#10	Literaltb=8'hA2; Addrtb=8'h0C; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //JMP 162
#10	Literaltb=8'h00; Addrtb=8'h00; calutb=8'h01; csrctb=2'h3; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //ADD R0,R1,R2
#10	Literaltb=8'h3c; Addrtb=8'h00; calutb=8'h00; csrctb=2'h3; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'h2;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //CEE TEST NO SKIP IF SAME
#10	Literaltb=8'h30; Addrtb=8'h00; calutb=8'h00; csrctb=2'h3; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'h2;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //CEE TEST SKIP IF NOT SAME
#10	Literaltb=8'h00; Addrtb=8'h00; calutb=8'h01; csrctb=2'h2; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b1; //PUSH R0
#10	Literaltb=8'h00; Addrtb=8'h00; calutb=8'h00; csrctb=2'h0; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //IN R0
#10	Literaltb=8'h00; Addrtb=8'h00; calutb=8'h01; csrctb=2'h2; cmsrctb=3'h6; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b0; rettb=1'b0; poptb=1'b1; pushtb=1'b0; //POP R0
#10	Literaltb=8'h44; Addrtb=8'h03; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //LD R3,44H
#5 einttb = 1'b1;
#5 einttb = 1'b0;
#10	Literaltb=8'h00; Addrtb=8'h07; calutb=8'h00; csrctb=2'h2; cmsrctb=3'h3; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //MOV R7,R3
#10	Literaltb=8'd170; Addrtb=8'h0C; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b1; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //CALL 170d Works
#10	Literaltb=8'h66; Addrtb=8'h03; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b1;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //LD R3,66H  Works
#10	Literaltb=8'd170; Addrtb=8'd19; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b0; rettb=1'b1; poptb=1'b0; pushtb=1'b0; //RET   Doesn't Work
#10	Literaltb=8'd170; Addrtb=8'd19; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b0; rettb=1'b1; poptb=1'b0; pushtb=1'b0; //RET   Doesn't Work
#10	Literaltb=8'd00; Addrtb=8'h0C; calutb=8'h00; csrctb=2'h1; cmsrctb=3'h0; wr_entb=1'b1;  cpctb=2'b0;  caltb=1'b0; rettb=1'b0; poptb=1'b0; pushtb=1'b0; //JMP 00 Works
end

endmodule
