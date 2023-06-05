Program N09LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que atualize os campos CLG (classificação geral), CLC (classificação no cargo) e CCL (cargo de
classificação) no arquivo CAND.IND, conforme critérios da folha anterior.}
uses bibliont;

const vagas:array[1..12] of integer=
(20,15,17,18,15,20,14,12,17,18,17,20);

var arq: file of regis;
    reg: regis;
    chave: string[35];
    relatorio: string[20];
    a, b,erro,contlin,idade,tot,posi,pagina: integer;
    notas:array[1..6] of string[4];
    clc:array[1..12] of integer;
    idd:string[2];
    vet: vetor;

Begin
 writeln('Trabalho 09: Atualizando classificação geral e por cargo');
 assign(arq, 'cand.ind');
 reset(arq);
 //Cria o vetor para ordenar os candidatos por notas
 repeat
  a:= a+1;
  vet[a].pf:= posi;
  read(arq,reg);
  for b:=1 to 6 do
   str(reg.notas[b]:4,notas[b]);
  val(reg.data.ano,idade,erro);
  str(2023-idade,idd);
  str(reg.som:3,chave);
  //Cria a chave de ordenação com base nos critérios de desempate
  chave:=chave+notas[4]+notas[5]+notas[3]+notas[2]+notas[6]+notas[1]+idd;
  vet[a].cc:=chave;
  posi:= posi+1;
 until eof(arq);
 tot:= a;
 //Ordena os candidatos por notas
 writeln('Ordenando candidatos por notas...');
 ordem(vet,tot);
 //Atualiza a classificação geral
 writeln('Atualizando classificação geral e por cargo...');
 posi:=0;
 for a:=tot downto 1 do
  begin; 
   seek(arq,vet[a].pf);
   read(arq, reg);
   //Atualiza a classificação geral
	 posi:=posi+1;
	 reg.clg:=posi;
	 //Atualiza a classificação por cargo
	 clc[reg.car]:=clc[reg.car]+1;
	 reg.clc:=clc[reg.car];
	 //Verifica se a classificação do candidato esta dentro do número de vagas disponíveis
	 if (reg.clc <= vagas[reg.car]) then
	  reg.ccl:=reg.car;
   //Registra as atualizações
   seek(arq,vet[a].pf);
   write(arq, reg);
  end;
 close(arq);
 writeln('Classificação dos candidatos atualizada com sucesso!');
 fim;
End.