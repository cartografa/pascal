{10. Realizar un programa modularizado que lea secuencia de numeros enteros.
La lectura finaliza cuando llega el numero 123456, el cual no debe procesarse.
Informar en pantalla para cada numero la suma de sus digitos pares y
la cantidad de digitos impares que posee.}

program ejercicio10;

procedure sumadorDePares (num: integer; var suma: integer);
var
   ultimo: integer;
begin
     suma:= 0;
     while (num <> 0) do
     begin
          ultimo:= num mod 10;
          if (ultimo mod 2 = 0) then suma:= suma + ultimo;
          num:= num div 10;
     end;
end;

procedure cantidadDigitosImpares (num: integer; var cantI: integer);
begin
   cantI:= 0;
   while (num <> 0) do
   begin
        if (num mod 2 <> 0) then cantI:= cantI + 1;
        num:= num div 10;
   end;
end;

var
   numero, sumaPares, cantidadImpar: integer;

begin
     writeln('Ingrese numero: ');
     read(numero);
     while (numero <> 123456) do
     begin
          sumadorDePares(numero, sumaPares);
          cantidadDigitosImpares(numero, cantidadImpar);
          writeln('La suma de sus digitos pares es ', sumaPares);
          writeln('La cantidad de digitos impares es ', cantidadImpar);
          writeln('=============================================');
          writeln('Ingrese numero: ');
          read(numero)
     end;
     readln;
     readln;
end.
