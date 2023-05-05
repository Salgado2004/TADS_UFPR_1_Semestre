Program N04LEONARDO_SALGADO;
//Feito por Leonardo Felipe Salgado

{Faça um programa que leia uma série de CPF’s e informe se o CPF lido é válido ou não. CPF
“00000000000” (onze zeros) encerra o programa. Use o exercício 10 da lista 2 (enviado) como
referência. Garantir que sejam digitados 11 dígitos (validar).}

var cpf:string[11];
		cpfFormatado:string[14];
    dvc:integer;
    resultado:boolean;
    
procedure readCPF(var cpf:string[11]);
	var a,erro: integer;
			chave:boolean;
	begin
		repeat
			chave:=true;
			write('Informe seu CPF (somente números!) => ');
			readln(cpf);
			val(cpf,a,erro);
			if (erro>0)then
				 chave:=false;
			if (length(cpf)<>11)then
				 chave:=false;
			if not chave then
				writeln('CPF digitado incorretamente!');
				writeln;
		until chave;
	end;
	
function validaCPF(cpf:string[11]; mult:integer; var dvc:integer):boolean;
	var ind,num,soma,ee,resto,dvl,limit:integer;
	begin
		soma:=0;
		val(cpf[mult],dvl,ee);
		limit:=mult-1;
		for ind:=1 to limit do
		 begin
			val(cpf[ind],num, ee);
			soma:=soma+num*mult;
			mult:=mult-1;
		 end;
		resto:=soma mod 11;
		dvc:=11-resto;
		if (dvc>9) then
			dvc:=0;
		if (dvc = dvl) then
			validaCPF:=true
		else
			validaCPF:=false
	end;

Begin
	writeln('Trabalho 4: Validando um CPF');
	writeln;
	readCPF(cpf);
	while (cpf <> '00000000000') do
	 begin
	 	cpfFormatado := copy(cpf,1,3)+'.'+copy(cpf,4,3)+'.'+copy(cpf,7,3)+'-'+copy(cpf,10,2);
	  writeln('CPF lido => ', cpfFormatado);
		resultado:= validaCPF(cpf,10,dvc); 
		writeln('Digito verificador para a posição 10 => ', dvc);
		if (resultado) then
		 begin
			resultado:= validaCPF(cpf,11,dvc);
			writeln('Digito verificador para a posição 11 => ', dvc);
			if (resultado) then
				writeln('Este CPF é VÁLIDO')
			else
 			  writeln('Este CPF é INVÁLIDO')
 		 end
		else
			writeln('Este CPF é INVÁLIDO');	
		readCPF(cpf);
	 end;
  write('Programa encerrado');
End.