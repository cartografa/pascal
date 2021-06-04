{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.

Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}


program ejercicio7;
type
    rango = 0..9;
    numeros = array [rango] of integer;

procedure inicializar (var d: numeros);
var
   i: rango;
begin
   for i:= 0 to 9 do
       d[i]:= 0;
end;

procedure descomponer (var d: numeros; n: integer);
var
   aux: rango;
begin
     while (n <> 0) do begin
           aux:= n mod 10;
           d[aux]:= d[aux] + 1;
           n:= n div 10;
     end;
end;

procedure informe (d: numeros);
var
   i, digmax: rango;
   max: integer;

begin
     max:= -1;
     for i:= 0 to 9 do begin
         if (d[i] <> 0) then
               writeln('Numero ', i,': ', d[i],' veces.');
         if (d[i] > max) then begin
               max:= d[i];
               digmax:= i;
         end;
     end;
     writeln('El digito mas leido fue el ', digmax);
     write('Los digitos que no tuvieron ocurrencias son: ');
     for i:= 0 to 9 do begin
         if (d[i] = 0) then
               write(i,' ');
     end;
end;

var
   digitos: numeros;
   n: integer;

begin
     inicializar(digitos);
     writeln('Ingrese numero');
     read(n);
     while (n <> -1) do begin
           descomponer(digitos, n);
           writeln('Ingrese numero');
           read(n);
     end;
     informe(digitos);
     readln;
     readln;
end.
