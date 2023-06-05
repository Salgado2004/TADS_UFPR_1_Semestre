Program N01LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{FUP que leia dois números e a operação aritmética desejada (+, –, *, /). Após a leitura calcule, 
SE POSSÍVEL e mostre a resposta da operação realizada. Se não for possível realizar a operação, 
mostrar a palavra ERRO e a resposta que será 0(zero).}

//VERSÃO COM IF

var n1, n2, result: real;
    ops: string[1];

Begin
 writeln('Trabalho 1: Calculador básico');
 writeln();
 writeln('Digite o primeito número e pressione Enter: ');
 readln(n1);
 writeln('Digite o segundo número e pressione Enter: ');
 readln(n2);
 writeln('Digite a operação desejada (+, -, *, /) e pressione Enter: ');
 readln(ops);
 writeln();
 writeln('Realizando operação: ', n1, ops, n2);
 if (ops = '+') then
  begin
   result := n1+n2;
   writeln('Resultado: ', result);
  end;
 if (ops = '-') then
  begin
   result := n1-n2;
   writeln('Resultado: ', result);
  end;
 if (ops = '*') then
  begin
   result := n1*n2;
   writeln('Resultado: ', result);
  end;
 if (ops = '/') then
  begin
   if (n2 = 0) then
    writeln('ERRO: Divisão por 0')
   else
    result := n1/n2;
    writeln('Resultado: ', result);
  end;
End.

// VERSÃO COM CASE

{var n1, n2, result: real;
		ops: char;

Begin
	writeln('Trabalho 1: Calculador básico');
	writeln();
	writeln('Digite o primeito número e pressione Enter: ');
	readln(n1);
	writeln('Digite o segundo número e pressione Enter: ');
	readln(n2);
	writeln('Digite a operação desejada (+, -, *, /) e pressione Enter: ');
	readln(ops);
	writeln();
	writeln('Realizando operação: ', n1, ops, n2);
	case ops of
		'+': result := n1+n2;
		'-': result := n1-n2;
		'*': result := n1*n2;
		'/': if (n2 = 0) then
					writeln('ERRO: Divisão por 0')
				 else
					result := n1/n2;
	end;
	writeln('Resultado: ', result);
End.}

