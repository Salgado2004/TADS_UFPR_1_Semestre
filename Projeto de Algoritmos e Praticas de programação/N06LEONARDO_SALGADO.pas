Program gercandtxtv2 ;
//Feito por Leonardo Felipe Salgado
{O trabalho consiste em alterar o programa gercandtxtv1, validando todas as
informações que serão digitadas, a menos do nome.}

uses bibliont;

var
 arq:text; //NOME LÓGICO DO ARQUIVO (SERÁ TIPO TEXTO - ACESSO SEQUENCIAL)
 reg:string[60]; //REGISTRO SERÁ DE 60 CARACTERES
 num,car,dd,mm,aa,a,b,c,tam:integer;
 nome:string[35];
 cpf:string[11];
 numa,anoa:string[4];
 dda,mma,caa:string[2];
 
Begin
 writeln('Trabalho 06: Inscrição para concurso público');
 writeln;
 assign(arq,'sai1.txt'); //LIGA NOME LÓGICO AO FÍSICO
 append(arq); //ABRE PARA ACRESCENTAR REGISTROS (SÓ TIPO TEXTO ACESSO/ORGANIZAÇÃO SEQUENCIAL)
//VALIDAR O NUMERO LIDO. TEM QUE SER MENOR QUE 9999
 repeat
  leitura('Número de inscrição ',num);
  if (num > 9999) then
   writeln('O número de inscrição deve ter apenas 4 dígitos!!');
 until num <= 9999;
 while (num > 0) do
  begin 
   writeln;
   str(num,numa); //TRANFORMA NUM INTEGER EM STRING[4]
   tam:=length(numa);
   for a:=1 to 4-tam do
    insert('0',numa,1); //INSERE 0 A ESQUERDA
   write('Digite seu nome completo => ');
   readln(nome);
   nome:=upcase(nome);
   tam:=length(nome);
   for a:=tam+1 to 35 do
    insert(' ',nome,a); //INSERE ESPAÇOS A DIREITA
//VALIDAR O CPF (USAR A FUNÇÃO DA BIBLIONT)
   repeat 
    writeln;
	  write('Digite seu CPF => ');
    readln(cpf);
    if (not validacpf(cpf)) then
     writeln('O CPF deve ser válido!!');
   until validacpf(cpf);
//VALIDAR A DATA (USAR A FUNÇÃO DA BIBLIONT)
   repeat 
    writeln;
    leitura('Dia de nascimento ',dd);
    leitura('Mês de nascimento ',mm);
    leitura('Ano de nascimento ',aa);
    if (not validata(dd,mm,aa)) then
     writeln('Data inválida!!');
   until validata(dd,mm,aa);
//VALIDAR O CARGO - TEM QUE ESTAR ENTRE 1 E 12
   repeat   
    writeln;
    leitura('Cargo desejado ',car);
    if (car > 12) then
     writeln('Digite um cargo válido!!');
   until car <= 12;
   str(dd,dda); //TRANSFORMA DIA EM STRING[2]
   if(dd<10)then
    insert('0',dda,1);
   str(mm,mma); //TRANSFORMA MES EM STRING[2]
   if(mm<10)then
    insert('0',mma,1);
   str(aa,anoa); //TRANSFORMA ANO EM STRING[4]
   str(car,caa); //TRANSFORMA CARGO EM STRING[2]
   if(car<10)then
   insert('0',caa,1);
//Insiro os campos strings no registro de trás para frente inserindo sempre na posição 1
   insert(caa,reg,1);
   insert(anoa,reg,1);
   insert(mma,reg,1);
   insert(dda,reg,1);
   insert(cpf,reg,1);
   insert(nome,reg,1);
   insert(numa,reg,1);
//ABRA O ARQUIVO SAI1.TXT, DEPOIS DE ENCERRAR, E CONFIRA
   writeln(arq,reg); //GRAVA O REGISTRO
//VALIDAR O NUMERO LIDO. TEM QUE SER MENOR QUE 9999
   writeln;
   repeat  
    writeln;
    leitura('Número de inscrição ',num);
    if (num > 9999) then
     writeln('O número de inscrição deve ter apenas 4 dígitos!!');
   until num <= 9999;
  end;
 close(arq);
 fim;
End.