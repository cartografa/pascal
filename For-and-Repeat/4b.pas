{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles
son los dos números mínimos leídos.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al
leer el número 0, el cual no debe procesarse}

program ejemplo;
var
   num, min1, min2, i: integer;
begin
   min1:= 99999;
   min2:= 99999;
   num:= 1;
   while (num<>0) do
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
