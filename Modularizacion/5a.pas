{ 5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA. }

program ej5partea;

function esDobleDeA (uno, dos: integer): boolean;
         begin
              esDobleDeA:= ((dos*2) = uno);
         end;

var
   numA, numB: integer;
begin
   writeln('Ingrese primer numero ');
   readln(numA);
   writeln('Ingrese segundo numero ');
   readln(numB);
   if (esDobleDeA(numA, numB)) then
      writeln('El numB es exactamente el doble de numA')
      else
      writeln('No se cumple la condicion');
   readln;
end.
