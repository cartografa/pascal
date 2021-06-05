{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo,
si se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído}

program ejemplo;
var
   num, mayor, i, pos: integer;
begin
   pos:= 0;
   mayor:= -9999;
   for i:= 1 to 10 do
       begin
       writeln('Ingrese los 10 numeros :');
       read(num);
       if num>mayor then
          begin
          mayor:= num;
          pos:= i;
          end;
       end;
   writeln('El mayor numero leido fue el ', mayor,' en la posicion ', pos);
   readln;
   readln;
end.
