module ARM(
    input wire eint,
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
    output wire CEENZ,
    input wire [7:0] ambain,
    output wire [7:0] stack
    );



ALU U1 (rst,R1,R2,Lit,calu,CEE);
Memory U2 (eint,CEENZ,addr, datain, dataout, wr_en, clk,R0,R1,R2,R3,R4,R5,R6,PC,cpc,rst,CEE,muxout,Lit,csrc,call,ret,pop,push,LNK,stack);
MUX U3 (cmsrc,R0,R1,R2,R3,R4,R5,dataout,ambain,muxout);
Compare U4 (CEE,Lit,CEENZ);

    
endmodule


