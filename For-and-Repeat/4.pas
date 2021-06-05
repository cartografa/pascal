{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles
son los dos números mínimos leídos.}

program ejemplo;
var
   num, min1, min2, i: integer;
begin
   min1:= 99999;
   min2:= 99999;
   for i:= 1 to 4 do
       begin
       writeln('Ingrese numero ');
       readln(num);
       if (num<min1) then
          begin
          min2:= min1;
          min1:= num;
          end;
       if (num<min1) and (num>min2) then
           min2:=num;
       end;
    writeln('Los dos minimos ingresados son: ', min1,' y ',min2);
    readln;
end.
