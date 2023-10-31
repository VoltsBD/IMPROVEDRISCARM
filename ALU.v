module ALU(
input wire rst, // rst for cee
input wire [7:0] AYE,  // A
input wire [7:0] BEE,  // B
input wire [7:0] Lit,  // Lit
input wire [4:0] CALU, // Control for the ALU
output reg [7:0] CEE // C=A(OP)B or C = A (OP) Lit
    );

always@(*)
begin

if(!rst) 
begin
CEE=8'h00;
end

if(rst)
begin
     case(CALU)
                    5'h01: 
                    CEE = AYE + BEE;  // C=A+B
                    5'h02: 
                    CEE= AYE - BEE;   // C=A-B
                    5'h03:
                    CEE = AYE * BEE;    // C = A*B
                    5'h04: 
                    CEE = ~AYE;        // NOT A
                    5'h05:
                    CEE = AYE && BEE;  // AND
                    5'h06:
                    CEE = AYE || BEE; // OR
                    5'h07:
                    CEE = AYE ^ BEE; // XOR
                    5'h08:
                    CEE = ~CEE;    // C = NOT C
                    5'h11: 
                    CEE = AYE + Lit;  // C=A+B
                    5'h12: 
                    CEE= AYE - Lit;   // C=A-B
                    5'h13:
                    CEE = AYE * Lit;    // C = A*B
                    5'h15:
                    CEE = AYE && Lit;  // AND
                    5'h16:
                    CEE = AYE || Lit; // OR
                    5'h17:
                    CEE = AYE ^ Lit; // XOR                 
                 default: 
                 CEE=CEE;
            endcase
end

end    
endmodule
