module Concatena7Zeros(Entrada,Saida);


input wire Entrada;
output wire [7:0] Saida;


assign Saida = {7'b0000000,Entrada};


endmodule

