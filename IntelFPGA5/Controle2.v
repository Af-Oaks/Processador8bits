module
Controle2(OPcode,BitVerificao,clock,EscrevMem,LerMem,Jump,Halt,UlaOp,FonteUla,EscrevReg,Beqz);
input wire [2:0]OPcode;
input wire [1:0]BitVerificao;
input wire clock;
output reg EscrevMem,LerMem,Jump,Halt,EscrevReg,Beqz;
output reg [1:0] FonteUla,UlaOp;
reg [3:0]type2;
reg [9:0] InstrucaoMem [11:0]; // 12 instruï¿½ï¿½es guardadas em palava sde 12bits;
initial begin
//e0emplo de acessar as flags de controle no registrador
//load EscrevMem,LerMem,Jump,Halt,UlaOp,Beqz,EscrevReg,FonteUla;
//instrucoes[0000] = 10'b 0 1 0 0 00 0 1 00

type2 = 4'b0000;
EscrevMem = 0;
LerMem = 0;
Jump = 0;
Halt = 0;
UlaOp = 2'b00;
FonteUla = 2'b00;
Beqz = 0;
EscrevReg =0;

end

/*instruções

EscrMem    0 1 0 0 0 0 0 0 0 0 0 0
LerMem     1 0 0 0 0 0 0 0 0 0 0 0
Jump       0 0 0 0 1 0 0 0 0 0 0 1
Halt       0 0 0 0 0 0 0 0 0 0 0 0
UlaOP      X X 00 00 X 10 01 00 X X X X
BeqZ       0 0 0 0 0 0 0 1 0 0 0 0
EscreReg   1 0 1 1 0 1 1 1 0 1 1 0
FonteULA   X X 1 0 X 0 10 0 X X X X
*/


always @(*) begin

type2 = 4'b0000;
EscrevMem = 0;
LerMem = 0;
Jump = 0;
Halt = 1;
UlaOp = 2'b00;
FonteUla = 2'b00;
Beqz = 0;
EscrevReg =0;

 
//load
if (OPcode == 3'b000) begin
LerMem = 1;
EscrevReg = 1;
Halt = 0;
end
//store
if (OPcode == 3'b101) begin
EscrevMem = 1;
Halt = 0;
end
//add
if (OPcode == 3'b010) begin
EscrevReg = 1;
FonteUla = 2'b01;
Halt = 0;
end
//addi
if (OPcode == 3'b011) begin
EscrevReg = 1;
Halt = 0;
end
//setz
if (OPcode == 3'b100) begin
EscrevReg = 1;
UlaOp = 2'b10;
Halt = 0;
end
//slt
if (OPcode == 3'b001) begin
EscrevReg = 1;
FonteUla = 2'b10;
UlaOp = 2'b01;
Halt = 0;
end
//beqz
if (OPcode == 3'b110) begin
EscrevReg = 1;
Beqz = 1;
Halt = 0;
end

if (OPcode == 3'b111) begin
if (BitVerificao == 2'b00)begin
Halt = 1;
end
//invs
if (BitVerificao == 2'b01)begin
EscrevReg = 1;
Halt = 0;
end
//invt
if (BitVerificao == 2'b10)begin
EscrevReg = 1;
Halt = 0;
end
//jr
if (BitVerificao == 2'b11)begin
Jump = 1;
Halt = 0;
end

end

end
endmodule
