Program N02LEONARDO_SALGADO;
//Leonardo Felipe Salgado

{FUP que leia uma lista de números inteiros, terminada pelo número 0 e que, para cada número lido, 
mostre o próprio número e a relação de seus divisores.}

var num, divs, result: integer;
		loop: string[3] = 'sim';

Begin
	writeln('Trabalho 2: Um número e seus divisores');
	while (loop = 'sim') do
		begin
			writeln();
			writeln('Digite um número inteiro e pressione Enter: ');
			readln(num);   
			if (num = 0) then break;
			writeln('Número lido: ', num);
			divs := num;
			if (divs < 0) then
				divs := divs * -1;
			writeln('Divisores: ');
			repeat
				result := num mod divs;
				if (result = 0) then
					writeln('		', divs);
				divs := divs-1;
			until divs = 0; 
			writeln();
			writeln('Deseja continuar? sim/não');
			readln(loop);
		end;
End.