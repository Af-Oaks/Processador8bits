module portaOr3(entrada1,entrada2,entrada3,Saida, Clock);

input wire Clock;
input wire entrada1,entrada2,entrada3;
output wire Saida;

assign Saida = entrada1 | entrada2 | entrada3;

endmodule

