
module ULA(entrada1,entrada2,ULAop,Zero,Resultado,clock);
input wire [7:0] entrada1,entrada2;
input wire [1:0] ULAop;
output reg Zero;
output reg [7:0] Resultado;
input wire clock;
reg [7:0] estado;
always @(*) begin
   
Zero = 0;

if(ULAop == 2'b00)begin//soma
	Resultado = entrada2+entrada1;
   end
if(ULAop == 2'b01)begin//set less than
	Resultado = entrada1<entrada2;
   end
if(ULAop == 2'b10)begin//AND
       Resultado = entrada1 & entrada2;
   end

if(Resultado == 8'b00000000)begin
       Zero = 1;
   end
	
end
endmodule

 