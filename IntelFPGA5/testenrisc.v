module testenrisc;
  reg [7:0] Endereco_init_inst;
  reg Clock;
wire [7:0] instr_lida;
wire [7:0] saida_pc_inst, saida1, saida2, from_mem;
wire LerMem, EscrevMem;


  // Instanciando o módulo nRisc
	//Clock, saida1,saida2,from_mem,ler_mem,Escrevemem)
  nRisc dut(Clock, saida1, saida2, from_mem, LerMem, EscrevMem);

//module DataMEM (leitura, escrita, endereco,entrada,saida,clock);
  DataMEM MEM(LerMem, EscrevMem, saida1, saida2, from_mem, Clock);



  initial begin
//$monitor("PC+halt = %d , saida pc1 = %d, Halt = %b,  r_or=%b  beq = %b,  jump = %b   zero = %b  and = %b , type2 = %b,  inst = %b, ins_final = %b", dut.Pc_p_halt, dut.saida_pc1, dut.Halt, dut.r_o2mpc, dut.Beqz, dut.Jump, dut.zero, dut.r_a2mpc,
//dut.ctrl.type2, dut.saida_inst[7:5], dut.saida_inst[1:0]);

//$monitor("PC = %b , t1 = %d, cima = %d, baixo = %d", dut.BancoRegs.RF[5], dut.BancoRegs.RF[0], dut.s_sup, dut.s_inf);

//$monitor("clock = %b , t1 = %d,  rula = %d   mux1 = %d  mux2 = %d  mux3 = %d  s7 = %d", Clock, dut.BancoRegs.RF[0], dut.r_ula , dut.r_mem_ula, dut.s_p_inv, dut.data_to_write, dut.instruct.Saida[7]);
 
//$monitor("or 3 = %d pula = %d  pinv = %d  write = %d", dut.r_or3, dut.r_mem_ula, dut.s_p_inv, dut.data_to_write) ; 

//addi 
//pc - instrucao - regConcat - sinal_ext - saida2 - fonteUla - s_sup_f - s_inf - Mbeqz - ulaOp - R_ula - r_or3 - p_ula - s_p_inv - data_to_write - m32
//$monitor("pc %d - instrucao %b - regConcat %b - sinal_ext %d - saida2 %d - fonteUla %b - s_sup_f %d - s_inf %d - Mbeqz %b - ulaOp %b -  R_ula %d - r_or3 %b - p_ula %d - s_p_inv %d - data_to_write %d - m32 %b"
//, dut.saida_pc1, dut.saida_inst, dut.nRegConcat, dut.sinal_ext, dut.saida2, dut.FonteUla, dut.s_sup, dut.s_inf,  dut.s_sup_f, dut.UlaOp, dut.r_ula, dut.r_or3, dut.r_mem_ula, dut.s_p_inv, dut.data_to_write, dut.nRegDest);

//halt
//saida_pc1, halta, r_soma1, epc2_1, epc_2, to_pc
//$monitor("Clock -%d- saida_pc1 %d, halta %b, r_soma1 %b, epc_2 %b, contorle %b, to_pc %d", Clock,dut.saida_pc1, dut.Halt, dut.Pc_p_halt, dut.s_pre1_pc, dut.r_o2mpc, dut.Endereco_init_reg);

//ver progresso das coisas
//$monitor("PC =%d | inst =(%b) clock=(%d) , reg1 =%d, reg2 =%d , reg3 = %d(%b), reg4 =%d(%b)  ula = %d  MEM[0] = %d",dut.BancoRegs.RF[5],dut.saida_inst,Clock,dut.BancoRegs.RF[0],dut.BancoRegs.RF[1],dut.BancoRegs.RF[2],dut.BancoRegs.RF[2],dut.BancoRegs.RF[3],dut.BancoRegs.RF[3], dut.r_ula, MEM.DataMem[0]);

//caminho beqz
//$monitor("PC= %d |instru = %b| Beq= %b | zero= %b | and1 =%b | or1 =%b | entr1= %d | ent2= %d | SelMux= %b || muxA-> ent1=%d | ent2=%d | sin_ext= %d | pc+halt= %d Bef_ext= %d",dut.BancoRegs.RF[5],dut.saida_inst[4:2],dut.Beqz,dut.zero,dut.r_a2mpc,dut.r_o2mpc,dut.Pc_p_halt,dut.s_pre1_pc,dut.r_o2mpc,dut.prox_pc,dut.saida1,dut.sinal_ext,dut.Pc_p_halt,dut.extende.entrada);

//beqz 2
//monitor("PC= %d |instru = %b| beqz=%b | zero= %b | m2entr1= %d | m2ent2= %d | SelMux2= %b || reg1= %d | reg2 =%d | reg3= %d | mf2= %b |E_inf= %b | ULAop= %b | fontU= %b | Res = %b",dut.BancoRegs.RF[5],dut.saida_inst[5],dut.Beqz,dut.zero,dut.Pc_p_halt,dut.s_pre1_pc,dut.r_o2mpc,dut.BancoRegs.RF[0],dut.BancoRegs.RF[1],dut.BancoRegs.RF[2],dut.s_sup_f,dut.ula.entrada2,dut.UlaOp,dut.FonteUla,dut.ula.Resultado);

//set lestt thalsnd
//$monitor("PC =%d | clock=(%d) , reg1 =%d, reg2 =%d , reg3 = %d(%b), reg4 =%d(%b)  ulaop = %d  ULAent1 =%d ,ULAent2 =%d | r =%d",dut.BancoRegs.RF[5],Clock,dut.BancoRegs.RF[0],dut.BancoRegs.RF[1],dut.BancoRegs.RF[2],dut.BancoRegs.RF[2],dut.BancoRegs.RF[3],dut.BancoRegs.RF[3], dut.UlaOp,dut.s_sup,dut.s_inf,dut.r_ula);
//$monitor("PC =%d | clock=(%d) ,reg2 =%d , reg3 = %d(%b),ulaop = %d  ULAent1 =%d ,ULAent2 =%d | r =%d | estado=%b ",dut.BancoRegs.RF[5],Clock,dut.BancoRegs.RF[1],dut.BancoRegs.RF[2],dut.BancoRegs.RF[2],dut.BancoRegs.RF[3], dut.UlaOp,dut.s_sup,dut.s_inf,dut.r_ula,dut.ula.estado);
//inverter
//$monitor("pc %d reg4 =%d - instrucao %b | dadoAE= %d | regEsc =%b | permReg =%b ",dut.BancoRegs.RF[5],dut.BancoRegs.RF[3],dut.saida_inst,dut.data_to_write,dut.nRegDest,dut.EscrevReg);


//mostrar resultado
$monitor("PC = %d | REG1 = %d | REG2 = %d HALT =%b ",dut.BancoRegs.RF[5],dut.BancoRegs.RF[0],dut.BancoRegs.RF[1],dut.Halt);


repeat(90)begin
#50 Clock = 0;
#50 Clock = 1;
end


 

 
  end
endmodule

