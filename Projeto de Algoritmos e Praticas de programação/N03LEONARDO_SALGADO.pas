Program N03LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{O programa nmod deverá ser modificado para a utilização dos módulos indicados abaixo. Escrever os 
módulos em forma de procedure e function, na frente do arquivo que conterá o trabalho 03.
Colocar as respostas das perguntas (5) no final do arquivo que conterá o trabalho 03, como
comentário.}

var p1, p2, n, x, num, r: integer;

function inteiro(nn:real):integer;
	var mult, iint: integer;
			div1, ll:real;
	begin
		div1 := nn;
		mult := 1;
		if (div1 < 0) then
			mult := -1;
		div1 := div1 * mult;
		iint := 0;
		ll := 0;
		repeat
			iint := iint+1;
			ll := ll+1;
		until (ll > div1);
		inteiro := (iint-1)*mult;
	end;
	
function resto(a, b: integer):integer;
	var inter: integer;
	begin
		inter := inteiro(a/b);
		resto := a - inter*b;
	end;
	
procedure sai;
	begin
		writeln();
		writeln('Multiplos de ', n, ' = ', p1);
		writeln('Não multiplos de ', n, ' = ', p2);
		writeln();
	end;
	
procedure testa(res:integer; var mu, nmu:integer);
	begin
		if (res = 0) then
			mu := mu +1
		else
			nmu := nmu +1;	
	end;

Begin
	p1:=0;
	p2:=0;
	n:=2;
	writeln('Trabalho 3: Quantos números são múltiplos de 2 e 3?');
	writeln();
	writeln('Digite 10 números e direi quantos são múltiplos de 2:');
	for x:= 1 to 10 do
		begin
			write('	Digite o ', x:3,'. número e pressione enter => ');
			readln(num);
      r := resto(num, n);
      testa(r, p1, p2);
    end;
  sai;
  p1:=0;
	p2:=0;
	n:=3; 
	writeln('Digite 10 números e direi quantos são múltiplos de 3:');
	for x:= 1 to 10 do
		begin
			write('	Digite o ', x:3,'. número e pressione enter =>');
			readln(num);
      r := resto(num, n);
      testa(r, p1, p2)
    end;
  sai
End.

{1- Escreva os nomes das variáveis locais.
	resposta: mult, iint, div1, ll, inter.  
	
2- Escreva os nomes das variáveis globais.  
	resposta: p1, p2, n, x, num, r.
	
3- Escreva os nomes dos parâmetros formais. 
	resposta: nn, a, b, res, mu, nmu
	
4- Escreva os nomes dos parâmetros reais.   
	resposta: num, n, r, p1, p2
	
5- Explique o motivo de existir passagem de parâmetros por valor e por referência, na rotina
TESTA.
	resposta: O parâmetro por valor é passado apenas para que seja realizada a operação, e os parâmetros
	por referência foram passados para que fosse possível alterar o resultado das variáveis globais.

}