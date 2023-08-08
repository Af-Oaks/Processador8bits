module Soma1bit(entrada1,entrada2,Saida, clock);

input wire clock;
input wire[7:0]entrada1;
input wire entrada2;
output reg[7:0]Saida;
integer count2;

initial begin
Saida = 8'b00000000;
end

 always begin
@(clock) begin
Saida <= entrada1+entrada2;

end
end
endmodule