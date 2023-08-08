module Mux2fixa1(entrada1,OPcontrole,Saida);


input wire[7:0]entrada1;
input wire OPcontrole;
output reg[7:0]Saida;

initial begin
Saida = 8'b00000000;
end

always @(*) begin

   case(OPcontrole)
   1'b0: Saida = entrada1;
   1'b1: Saida = 8'b00000000;
   endcase


   end


endmodule

