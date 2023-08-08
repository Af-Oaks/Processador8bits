module ExtendeSinal(entrada,Saida);


input wire[2:0]entrada;
output reg[7:0]Saida;

always @(entrada)begin
   case(entrada[2])
   1'b0: Saida = {5'b00000, entrada};
   1'b1: Saida = {5'b11111, entrada};
   endcase
end
endmodule
