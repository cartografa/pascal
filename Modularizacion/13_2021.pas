{13. Realizar un programa modularizado que lea una secuencia de caracteres y
verifique si cumple con el patrón A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y
en la que aparece a lo sumo 3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program ejercicio13;

procedure patronA (var cumple: boolean; var cant: integer);
var
   c: char;
begin
   cumple:= true;
   cant:= 0;
   writeln('Ingrese la secuencia A');
   readln(c);
   while (c <>'%') and (cumple) do
   begin
        if (c ='$') then
           cumple:= false
        else
           cant:= cant+1;
        if (cumple) then
           readln(c);
   end;
end;

procedure patronB (var cumple: boolean; cantC: integer);
var
   cantArroba: integer;
   c: char;
begin
   cantArroba:= 0;
   writeln('Ingrese la secuencia B');
   readln(c);
   while (c <>'*') and (cantC >= 0) do
   begin
        cantC:= cantC-1;
        write(cantC);
        if (c='@') then cantArroba:= cantArroba+1;
        if (cantC >= 0) then read(c);
   end;
   if (cantArroba < 3) and (cantC <> 0) then
      cumple:= false;
end;

var
   contador: integer;
   cumple: boolean;
begin
   patronA (cumple, contador);
   writeln(contador);
   if (cumple) then begin
      patronB (cumple, contador);
      if (cumple) then
         writeln('Se cumple con el patron')
         else
         writeln('No se cumple el patron B')
   end
   else
      writeln('No se cumple con el patron A');
   readln;
   readln;
end.
