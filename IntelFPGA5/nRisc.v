module nRisc(
  input wire Clock,
  output wire [7:0] saida1, saida2,
  input wire [7:0] from_mem,
  output wire LerMem, EscrevMem
);
wire [7:0] Endereco_init_reg;
wire [7:0] saida_pc1;
wire [7:0] saida_pc2;
wire [7:0] saida_inst;
wire Jump,Halt,EscrevReg,Beqz;
wire [1:0] FonteUla,UlaOp;
wire [2:0] nRegSub;
wire [2:0] nRegConcat;
wire [2:0] nRegDest;
wire [7:0] saidasub;
wire [7:0] data_to_write;
wire [7:0] sinal_ext;
wire [7:0] Pc_p_halt;
wire [7:0] prox_pc;
wire [7:0] s_pre1_pc;
wire [7:0] s_sup, s_inf, r_ula, r_mem_ula, r_70, s_p_inv, s_fix, r_inv, s_sup_f;
wire zero, r_or3, r_and3, r_a2mpc, r_o2mpc;


//module PC(Entrada,Saida_instrucaco,Saida_reg_pc,Clock);
PC pc(Endereco_init_reg, saida_pc1, saida_pc2, Clock);

//module memo_instr(Entrada,Saida,Clock);
memo_instr instruct(saida_pc1, saida_inst, Clock);

//Controle(OPcode,BitVerificao,clock,EscrevMem,LerMem,Jump,Halt,UlaOp,FonteUla,EscrevReg,Beqz);
Controle2 ctrl(saida_inst[7:5], saida_inst[1:0], Clock,  EscrevMem, LerMem, Jump, Halt, UlaOp, FonteUla, EscrevReg, Beqz);

Soma1bit soma(saida_pc1, ~Halt,Pc_p_halt, Clock);

ExtendeSinal extende(saida_inst[4:2], sinal_ext);

Soma2num soma2(sinal_ext,Pc_p_halt,prox_pc);

Soma1bitSai3 s1s3(saida_inst[4:2],nRegSub);

Concatena1Zeros c0(saida_inst[1:0],nRegConcat);

//module Mux2(entrada1,entrada2,OPcontrole,Saida);
MuxReg rDest(nRegConcat,saida_inst[4:2],saida_inst[7],nRegDest);

//module BancoREG (Reg1,RegSubseq,Reg2,PermiteEscr,DadoEscr,EscrReg,Saida1,Saida2,SaidaSubseq,clock, PC_value);
BancoREG BancoRegs(saida_inst[4:2], nRegSub, nRegConcat, EscrevReg, data_to_write, nRegDest, saida1, saida2, saidasub, Clock, saida_pc2);

Mux2 pre1_pc(prox_pc,saida1,saida_inst[5],s_pre1_pc);

portaAnd2 a2mpc(Beqz, zero, r_a2mpc);

portaOr2 o2mpc(Jump, r_a2mpc, r_o2mpc);
//Mux2(entrada1,entrada2,OPcontrole,Saida);
Mux2 pre2_pc(Pc_p_halt, s_pre1_pc, r_o2mpc, Endereco_init_reg);

Mux3 sup(sinal_ext, saidasub, saida1, FonteUla, s_sup);

Mux3 inf(saida2, saida1, saida2, FonteUla, s_inf);

Mux2fixa1 m2f(s_sup, Beqz, s_sup_f);

//module ULA(entrada1,entrada2,ULAop,Zero,Resultado);
ULA ula(s_sup_f, s_inf, UlaOp, zero, r_ula,Clock);

portaOr3 or3(saida_inst[7],saida_inst[6],saida_inst[5], r_or3, Clock);

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// Falta buscar dado da memoria em caso de load
Mux2 res(from_mem, r_ula, r_or3, r_mem_ula);

Concatena7Zeros C70(r_mem_ula[7],r_70);

Mux2 pre_inv(r_mem_ula, r_70, instruct.Saida[7], s_p_inv);

SomaFixa sf(saida1, s_fix);

Mux2 inv(~saida1, s_fix, saida_inst[0], r_inv);

portaAnd3 and3(saida_inst[7],saida_inst[6],saida_inst[5], r_and3);

Mux2 to_breg(s_p_inv, r_inv, r_and3, data_to_write);



endmodule

