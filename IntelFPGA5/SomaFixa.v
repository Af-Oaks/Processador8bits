module SomaFixa(entrada,Saida);


input wire[7:0]entrada;
output wire[7:0]Saida;


assign Saida = entrada + 8'b10000000;


endmodule

