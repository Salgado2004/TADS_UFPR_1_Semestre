Program N05LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que leia uma relação de números positivos, encerrada por um número negativo. Após a
leitura, mostrar os números pares lidos em ordem crescente e os números ímpares lidos em
ordem decrescente. (Máximo de 100 números)}

var lista:array[1..100] of integer;
		tot,total, count, resto, aux, a, num, erro: integer;
		aux2:string[5];
		troca: boolean;

Begin
  //Validação do número
	repeat
	 write('Digite um número e pressione enter => ');
   readln(aux2);
   val(aux2,num,erro);
   if (erro<>0) then
    writeln('Eu pedi um número!');
  until erro = 0;
  a:= 0;
  //Criação do vetor
  while (num>0) and (a<100) do
   begin
    a:= a+1;
    lista[a]:= num;
    repeat
	   write('Digite um número e pressione enter => ');
     readln(aux2);
     val(aux2,num,erro);
     if (erro<>0) then
      writeln('Eu pedi um número!');
    until erro = 0;
   end;
  tot:= a;
  total:=tot;
  //Inicio da ordenação
  repeat
   tot:= tot - 1;
   troca:= true;
   for a:= 1 to tot do
    begin
     if (lista[a] > lista[a+1]) then
      begin
       aux:= lista[a];
       lista[a]:= lista[a+1];
       lista[a+1]:= aux;
       troca:= false;
      end;
    end;
	until troca;
	//Mostra a lista inteira ordenada
  writeln;
  write('Lista informada => ');
  for a:= 1 to total do
   write(lista[a], ' ');
  writeln;
  writeln('Total de números => ', total);
  //Mostra somente os números pares em ordem crescente
	writeln;
  write('Números pares => ');
  count:=0;
  for a:= 1 to total do
   begin
    resto:= lista[a] mod 2;
    if (resto = 0) then
     begin
      write(lista[a], ' ');
      count:= count+1;
     end;
   end;
  writeln;
  writeln('Total de números pares => ', count);
  //Mostra somente os ímpares em ordem decrescente
	writeln;
  write('Números ímpares => ');
  count:=0;
  for a:= total downto 1 do
   begin
    resto:= lista[a] mod 2;
    if (resto <> 0) then
     begin
      write(lista[a], ' ');
      count:= count+1;
     end;
   end;
  writeln;
  writeln('Total de números ímpares => ', count);  
End.