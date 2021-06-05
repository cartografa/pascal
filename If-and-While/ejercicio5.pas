{5. Modifique el ejercicio anterior para que, luego de leer el número X,
se lean a lo sumo 10 número reales. La lectura deberá finalizar al ingresar
un valor que sea el doble de X, o al leer el décimo número, en cuyo caso
deberá informarse “No se ha ingresado el doble de X”.}

program ejercicio4;
var
   numerox, numero, doble: real;
   repeticiones: integer;
begin
   repeticiones:= 1;
   numero:= 0;
   writeln('Ingrese numero principal ');
   readln(numerox);
   doble:= numerox*2;
   while (repeticiones<10) and (numero<>doble) do
         begin
         writeln('Ingrese numero ');
         readln(numero);
         repeticiones:= repeticiones+1
         end;
   if (numero<>doble) then
        writeln('No se ha ingresado el doble de ', numerox:4:2, '.');
   readln;
end.
