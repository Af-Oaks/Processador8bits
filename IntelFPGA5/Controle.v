module
Controle(OPcode,BitVerificao,clock,EscrevMem,LerMem,Jump,Halt,UlaOp,FonteUla,EscrevReg,Beqz);
input wire [2:0]OPcode;
input wire [1:0]BitVerificao;
input wire clock;
output reg EscrevMem,LerMem,Jump,Halt,EscrevReg,Beqz;
output reg [1:0] FonteUla,UlaOp;
reg [3:0]type2;
reg [9:0] InstrucaoMem [11:0]; // 12 instru��es guardadas em palava sde 12bits;
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

//case (OPcode)

// 3'b000: EscrevMem <= 0; LerMem <= 1; //load

//endcase

InstrucaoMem[4'b0000] = 10'b0100000100;//Load ok
InstrucaoMem[4'b0001] = 10'b0000010110;//SetLessThan ok
InstrucaoMem[4'b0010] = 10'b0000000101;//Add ok
InstrucaoMem[4'b0011] = 10'b0000000100;//AddI ok
InstrucaoMem[4'b0100] = 10'b0010000000;//Jump ok
InstrucaoMem[4'b0101] = 10'b1000000000;//Store ok
InstrucaoMem[4'b1100] = 10'b0000100100;//Setz ok
InstrucaoMem[4'b0110] = 10'b0000001100;//Beqz ok
InstrucaoMem[4'b0111] = 10'b0000000000;//Halt ok
InstrucaoMem[4'b1000] = 10'b0000000100;//InveSin ok
InstrucaoMem[4'b1001] = 10'b0000000100;//InvTudo ok
InstrucaoMem[4'b1010] = 10'b0010000000;//JumpReg ok
end
// bloco always q assina os valores da sequencia de bits para cada sinal de controle
always @(posedge clock) begin
if(OPcode == 3'b100 && BitVerificao == 2'b01)begin//acessar o Beqz
EscrevMem <=InstrucaoMem[4'b1100][9];
LerMem <=InstrucaoMem[4'b1100][8];
Jump <=InstrucaoMem[4'b1100][7];
Halt <=InstrucaoMem[4'b1100][6];
UlaOp <=InstrucaoMem[4'b1100][5:4];
Beqz <=InstrucaoMem[4'b1100][3];
EscrevReg <=InstrucaoMem[4'b1100][2];
FonteUla <=InstrucaoMem[4'b1100][1:0];
end
else if( OPcode == 3'b111)begin //acessar as instrucoes que tem os 2 bits de verifica��o
type2= OPcode +BitVerificao;
EscrevMem <=InstrucaoMem[type2][9];
LerMem <=InstrucaoMem[type2][8];
Jump <=InstrucaoMem[type2][7];
Halt <=InstrucaoMem[type2][6];
UlaOp <=InstrucaoMem[type2][5:4];
Beqz <=InstrucaoMem[type2][3];
EscrevReg <=InstrucaoMem[type2][2];
FonteUla <=InstrucaoMem[type2][1:0];
end
else begin //qualquer outra instru��o
EscrevMem <=InstrucaoMem[OPcode][9];
LerMem <=InstrucaoMem[OPcode][8];
Jump <=InstrucaoMem[OPcode][7];
Halt <=InstrucaoMem[OPcode][6];
UlaOp <=InstrucaoMem[OPcode][5:4];
Beqz <=InstrucaoMem[OPcode][3];
EscrevReg <=InstrucaoMem[OPcode][2];
FonteUla <=InstrucaoMem[OPcode][1:0];
end
end
endmodule
