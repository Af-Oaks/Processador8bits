module memo_instr(Entrada,Saida,Clock);
input [7:0]Entrada; // sinal de entrada(8bits) que pode ser escrito no registrador de PC
input Clock; // o clock e sinal de controle(1bit) para o funiconamento de PC
output reg [7:0]Saida; // saida do PC
reg [7:0] Memoria[255:0]; //memoria de com 256 palavras de 8bits

initial begin //dados escritos na m�o para dentro da memoria

Memoria[0] = 8'b10001101;    //nstz $t4 ok
 Memoria[1] = 8'b10001001;    //nstz $t3 ok
 Memoria[2] = 8'b10000001;    //nstz $t1 ok
 Memoria[3] = 8'b10000101;    //nstz $t2 ok
 Memoria[4] = 8'b01100100;    //naddi 1, $t1 ok
 Memoria[5] = 8'b01100001;    //naddi 0, $t2 ok
 Memoria[6] = 8'b01010011;    //nadd $zero, $t4 ok
 Memoria[7] = 8'b01101111;    //naddi 3, $t4 ok
 Memoria[8] = 8'b10100111;    //nsw $t2, $t4 ok
 Memoria[9] = 8'b10001101;    //stz $t4 ok
 Memoria[10] = 8'b11101110;    //ninvt $t4 ok
 Memoria[11] = 8'b01000010;   //nadd $t1,$t3 ok
 Memoria[12] = 8'b01001010;   //nadd $t3, $t3 ok
 Memoria[13] = 8'b11101001;   //ninvs $t3  ok
 Memoria[14] = 8'b00100110;   //nslt $t2, $t3 ok
 Memoria[15] = 8'b01000000;   //nadd $t1, $t1 ok
 Memoria[16] = 8'b11001110;   //nbeqz $t3, 3 ok 00 01 10 11
 Memoria[17] = 8'b01000001;   //nadd $t1,$t2 ok
 Memoria[18] = 8'b00010010;   //nlw $zero, $t3 ok
 Memoria[19] = 8'b11101011;   //njre $t3 ok
 Memoria[20] = 8'b01000010;   //nadd $t1,$t3 resultado em t3
 Memoria[21] = 8'b11100000;   //nhalt�ok



 end
 always @(*) begin// definde o sinal de saida como a palavra de 8bits no endere�o que foi recebido pelo sinal de entrada
	Saida = Memoria[Entrada];
end

endmodule
