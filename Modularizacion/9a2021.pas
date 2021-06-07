{9. a. Realizar un módulo que reciba como parámetro un número entero y retorne
la cantidad de dígitos que posee y la suma de los mismos.

b. Utilizando el módulo anterior, realizar un programa que lea una secuencia
de números e imprima la cantidad total de dígitos leídos.
La lectura finaliza al leer un número cuyos dígitos suman exactamente 10,
el cual debe procesarse. }

program ejercicio9;

procedure contadorYSumadorDeDigitos(num: integer; var digitos: integer; var suma: integer);
var
   dig: integer;
begin
     suma:= 0;
     while (num <> 0) do
     begin
        digitos:= digitos + 1;
        dig:= num mod 10;
        suma:= suma + dig;
        num:= num div 10
     end;
end;

var
   numero, digitos, suma: integer;

begin
   digitos:= 0;
   repeat
         write('Ingrese numero: ');
         read(numero);
         contadorYSumadorDeDigitos (numero, digitos, suma)
   until (suma=10);
   writeln('Cantidad de digitos: ', digitos);
   writeln('Suma de los digitos: ', suma);
   readln;
   readln;
end.
