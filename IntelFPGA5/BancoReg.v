module BancoREG (Reg1,RegSubseq,Reg2,PermiteEscr,DadoEscr,EscrReg,Saida1,Saida2,SaidaSubseq,clock, PC_value);
 input wire [2:0] Reg1,Reg2,EscrReg,RegSubseq; // the register numbers to read or write
 input wire [7:0] DadoEscr; // data to write
 input wire PermiteEscr; // the write control
 input wire clock; // the clock to trigger write
 input wire [7:0] PC_value;
 output reg [7:0] Saida1, Saida2, SaidaSubseq; // the register values read
 reg [7:0] RF [7:0]; // 8 registers each 8 bits long
 integer count;


initial begin   count = 0;   for (count=0;count<=7;count=count+1)     RF[count] = 8'b00000000; 
Saida1 = 8'b00000000;
Saida2 = 8'b00000000;
SaidaSubseq = 8'b00000000;
end


 always @(negedge clock) begin
    if (PermiteEscr)  RF[EscrReg] <= DadoEscr;
        RF[5] <= PC_value+1'b1;//escrever o endere�o de PC no seu registrador indpende do sinal de escrita
    
 end

always @(*) begin
        Saida1 = RF[Reg1];
        Saida2 = RF[Reg2];
        SaidaSubseq = RF[RegSubseq];
    end




endmodule

