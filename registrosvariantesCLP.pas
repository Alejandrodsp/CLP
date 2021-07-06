program Revenda;
uses crt;
type
 regVeiculos= record
 marca: string[15];
 modelo: string[15];
 ano: integer;
 case tipo: 1..3 of
 1: (portas: integer;
 potencia: real;
 );
 2: (cilindradas: real;
 partida: string[30];
 );
  3: (toneladas: real;
  eixos: integer;
 );
 end;
 
 var veiculos: array[1..100] of regVeiculos;
 i,n: integer;
 begin
 clrscr;
 writeln('Quantos veiculos deseja cadastrar? ');
 writeln;
 readln(n);
 for i:= 1 to n do 
 with veiculos[i] do
 begin
 writeln;
 writeln ('Digite o veiculo ', i,': ');
 write ('Marca: '); readln (marca);
 write ('Modelo: '); readln(modelo);
 write('Ano: '); readln (ano);
 write ('Qual o veiculo que deseja cadastrar? (1-Carro, 2-Moto, 3-Caminhão): ');readln(tipo);
 case tipo of
 1: begin
 write('Numero de portas: '); readln(portas);
 write('Potencia: '); readln (potencia);
 end;
 2: begin
 write('Cilindradas: '); readln(cilindradas);
 write('Partida: '); readln (partida);
 end;
 3: begin
 write('Toneladas: '); readln(toneladas);
 write('Numero de eixos: '); readln (eixos);
 end;
 end; {case}
 end; {with}
 writeln;
 for i:= 1 to n do
 with veiculos[i] do
 case tipo of
 1: writeln ('Carro: ', marca,' ', modelo,' Ano ', ano, ' Motor ', potencia:1:1, ' ', portas, ' portas');
 2: writeln ('Moto: ', marca,' ', modelo,' Ano ', ano, ' ', cilindradas:1:2, ' Cilindradas Partida ', partida, ' ');
 3: writeln ('Caminhão: ',marca,' ', modelo,' Ano ', ano, ' Carga máxima ', toneladas:1:2, ' Toneladas ', eixos, ' Eixos ');
 end;
 readkey;
end. 
