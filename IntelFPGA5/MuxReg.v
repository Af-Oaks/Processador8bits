module MuxReg(entrada1,entrada2,OPcontrole,Saida);


input wire[2:0]entrada1,entrada2;
input wire OPcontrole;
output reg[2:0]Saida;

initial begin
Saida = 3'b000;
end


always @(entrada1,entrada2,OPcontrole) begin


   case(OPcontrole)


   1'b0: Saida <= entrada1;
   1'b1: Saida <= entrada2;
   endcase


   end


endmodule

