program ejemplo;
procedure doble (numA, numB: integer; var elDoble:boolean; var cantidaddoble:integer);
begin
     if (numB=(numA*2)) then
        elDoble:= true;
     if elDoble then
        cantidaddoble:= cantidaddoble+1;

end;
var
   numA, numB, cantidaddoble, cantidad: integer;
   elDoble: boolean;
begin
     cantidad:=0;
     cantidaddoble:=0;
     elDoble:= false;
     writeln('Ingrese numero A: ');
     readln(numA);
     writeln('Ingrese numero B: ');
     readln(numB);
     while (numA<>0) and (numB<>0) do
     begin
     cantidad:=cantidad+1;
     writeln('Ingrese numero A: ');
     readln(numA);
     writeln('Ingrese numero B: ');
     readln(numB);
     doble (numA, numB, elDoble, cantidaddoble);
     elDoble:= false;
     end;
     writeln('La cantidad de pares en las que se cumple el doble es de ',cantidaddoble);
     writeln('La cantidad de pares ingresados fue de ',cantidad);
     readln;
end.
