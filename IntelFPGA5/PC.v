module PC(Entrada, Saida_instrucaco, Saida_reg_pc, Clock);
reg [7:0] PC_memo; // registrador 8 bits
input wire [7:0]Entrada; // sinal de entrada(8bits) que pode ser escrito no registrador de PC
input wire Clock; // o clock e sinal de controle(1bit) para ofuniconamento de PC
output reg [7:0]Saida_instrucaco;//saida do PC para a memoria
output reg [7:0]Saida_reg_pc; // saida do PC para o registrador $pc

initial begin
PC_memo = 8'b00000000;
Saida_reg_pc = 8'b00000000;
Saida_instrucaco = 8'b00000000;
end

always @(*) begin
Saida_instrucaco = PC_memo;
Saida_reg_pc = PC_memo;
end
always @(negedge Clock) begin
PC_memo = Entrada;
end

endmodule
