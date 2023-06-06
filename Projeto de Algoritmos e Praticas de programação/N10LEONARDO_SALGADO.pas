Program N10LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que possibilite mostrar os dados do arquivo CAND.IND conforme abaixo:
1 – Todos os candidatos CLASSIFICADOS nos cargos em ordem alfabética ou, 2 – Todos os candidatos em
ordem de classificação por cargo ou, 3 – Todos os candidatos em ordem de classificação geral. Dar as 
três opções para o usuário escolher uma.}
uses bibliont;

const cargos:array [1..12] of string[22]=
('Enganador de chefe    ','Enrolador de trabalho ','Pensador              ','Analista de sistemas  ',
 'Degustador de cerveja ','Tecnico em redes      ','Contador de estorias  ','Sai da aula antes     ',
 'Acougueiro limpinho   ','Seguranca de banheiro ','Gestor de borboletas  ','Agente leva e traz    ' );

var arq: file of regis;
    reg: regis;
    chave: string[35];
    relatorio: string[26];
    subtitulo:string[22];
    aux:string[4];
    a, b, contlin, pagina, tot, posi, opt,cargo: integer;
    vet: vetor;

procedure cabecalho2(relat:string[26]; subtitle:string[22]; var pag:integer);
 begin
  write('Aperte enter para continuar');
  readln;
  clrscr;
  pag:=pag+1;
  writeln('          ', relat, subtitle,'             Página: ', pag);
  writeln;
  writeln(' NUM: NOME:                                CLG:  CLC: CARGO:  FALTOU:');
 end;

Begin
 writeln('---------------------------------------------');
 writeln('| Trabalho 10: Classificação dos candidatos |');
 writeln('|                                           |');
 writeln('| Como você deseja mostrar os candidatos?   |');
 writeln('| 1 - Candidatos CLASSIFICADOS por nome     |');
 writeln('| 2 - Todos os candidatos por cargo         |');
 writeln('| 3 - Todos os candidatos no geral          |');
 writeln('---------------------------------------------');
 //Escolhe a opção que será usada para ordenar o vetor
 leitura('Opção ',opt); 
 assign(arq, 'cand.ind');
 reset(arq);
 //Cria o vetor para ordenar
 repeat
  read(arq,reg);
  //Seleciona a chave para ordenar o vetor pela escolha do usuário
  case opt of
   1: begin; str(reg.car:2, chave); str(reg.ccl:4,aux); chave:=chave+aux+reg.nome; relatorio:='Classificados: '; end;
   2: begin; str(reg.car:2, chave); str(reg.clc:4,aux); chave:=chave+aux; relatorio:='Classificação por cargo: '; end;
   3: begin; str(reg.clg:4, chave); relatorio:='Classificação geral'; end;
  end;
  //Não mostra os candidatos não classificados se a opção for 1
  if (opt <> 1) or (reg.ccl <> 0) then
   begin 
    a:= a+1;
    vet[a].pf:= posi;  
    vet[a].cc:=chave;
   end;
  posi:= posi+1;
 until eof(arq);
 tot:= a;
 //Ordena o vetor com base na chave escolhida
 writeln('Carregando resultado...');
 ordem(vet,tot);
 clrscr; 
 contlin:=25;
 for a:=1 to tot do
  begin;
   //Mostra os candidados na ordem do vetor ordenado
   seek(arq,vet[a].pf);
   read(arq, reg);
   //Mostra o nome do cargo se a opção não for Classificação geral
   if (opt <> 3) then
    subtitulo:=cargos[reg.car];
   //Mostra o cabeçalho a cada 20 linhas OU a cada mudança de cargo
   if (contlin = 25) or ((cargo <> reg.car) and (opt <> 3)) then
    begin
     cabecalho2(relatorio, subtitulo, pagina);
     contlin:=0;
    end;
   //Escreve somente as informações relevantes do candidato
   write(reg.num:5,' ',reg.nome,' ');
   writeln(reg.clg:5, reg.clc:5, reg.ccl:5, reg.falta:6);
   contlin:= contlin+1; 
   cargo:=reg.car;
  end;
 close(arq);
 fim; 
End.
