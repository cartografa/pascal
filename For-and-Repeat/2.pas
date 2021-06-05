{Realice un programa que lea 10 números e informe cuál fue el mayor número leído.}

program ejemplo;
var
   num, mayor, i: integer;
begin
   mayor:= -9999;
   for i:= 1 to 10 do
       begin
       writeln('Ingrese los 10 numeros :');
       read(num);
       if num>mayor then
          mayor:= num;
       end;
   writeln('El mayor numero leido fue el ', mayor);
   readln;
   readln;
end.
