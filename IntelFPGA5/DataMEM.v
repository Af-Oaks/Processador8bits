
module DataMEM (leitura, escrita, endereco,entrada,saida,clock);
input wire clock;
input wire leitura, escrita;
input [7:0] endereco, entrada;
output reg [7:0] saida;
reg [7:0] DataMem[255:0]; //memoria com 256 palavras de 8bits
integer count;

initial begin   count = 0;   for (count=0;count<=255;count=count+1)     DataMem[count] = 8'b00000000; end

always @(negedge clock)
begin
if (escrita) 
	DataMem[endereco] <= entrada;
end
always @(*) begin

if (leitura) 
	saida = DataMem[endereco];
end


endmodule
