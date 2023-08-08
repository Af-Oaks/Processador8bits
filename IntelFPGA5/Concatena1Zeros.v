module Concatena1Zeros(Entrada,Saida);


input wire [1:0] Entrada;
output wire [2:0] Saida;


assign Saida = {1'b0,Entrada};


endmodule

