{5. Realizar un programa que lea numeros enteros desde teclado. La lectura debe finalizar cuando
se ingrese el numero 100, el cual debe procesarse. Informar en pantalla:
. El numero maximo leido.
. El numero minimo leido.
. La suma total de los numeros leidos.}


program ejemplo;
var
   num, max, min, suma: integer;
begin
   min:= 99999;
   max:= -99999;
   suma:= 0;
   repeat
         writeln('Escriba el numero: ');
         readln(num);
         suma:= suma+num;
         if (num<min) then
            min:=num;
         if (num>max) then
            max:=num;
   until (num=100);
   writeln('El mayor numero leido fue ',max,' y el menor fue ',min);
   writeln('La suma de todos los numeros ingresados es de ',suma);
   readln;
end.
