{12. Realizar un programa modularizado que lea una secuencia de caracteres y
verifique si cumple con el patrón A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program ejercicio12;

function esVocal (c: char): boolean;
begin
     esVocal:= (c='a') or (c='A') or (c='e') or (c='E') or (c='i')
     or (c='I') or (c='o') or (c='O') or (c='u') or (c='U');
end;

procedure patronA (var cumple: boolean);
var
   c: char;
begin
     writeln('Ingrese secuencia A');
     readln(c);
     while (c <> '$') and (cumple) do begin
        if (not esVocal(c)) then
           cumple:= false
        else
           readln(c);
     end;
end;

function esLetraNoVocal (c: char): boolean;
begin
     esLetraNoVocal:= (c>'A') and (c<='z') and (not esVocal(c));
end;

procedure patronB (var cumple: boolean);
var
   c: char;
begin
     writeln('Ingrese secuencia B');
     readln(c);
     while (c <> '#') and (cumple) do begin
        if (not esLetraNoVocal(c)) then
           cumple:= false
        else
           readln(c);
     end;
end;

var
   cumple: boolean;

begin
     cumple:= true;
     patronA(cumple);
     if (cumple) then begin
        patronB(cumple);
        if (cumple) then
           writeln ('Se cumplen los patrones.')
        else
            writeln ('No se cumple el patron B.')
     end
     else writeln ('No se cumple el patron A.');
     readln;
end.
