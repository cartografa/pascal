{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de
los autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejemplo;
type
    palabra=string[50];
var
    nombre, puesto1, puesto2, puesto99, puesto100: palabra;
    tiempo, min1, min2, max1, max2, i: integer;
begin
    min1:= 99999;
    min2:= 99999;
    max1:= -99999;
    max2:= -99999;
    puesto1:= 'a';
    puesto2:= 'b';
    puesto99:= 'y';
    puesto100:= 'z';
    for i:= 1 to 6 do
        begin
        writeln('Ingrese nombre de la piloto:');
        readln(nombre);
        writeln('Ingrese tiempo:');
        readln(tiempo);
        if (tiempo<min1) then
           begin
           min2:= min1;
           puesto2:= puesto1;
           min1:= tiempo;
           puesto1:= nombre;
           end
        else
           if (tiempo<min2) then
              begin
              min2:= tiempo;
              puesto2:= nombre;
              end;
        end;
        if (tiempo>max1) then
           begin
           max2:= max1;
           puesto99:= puesto100;
           max1:= tiempo;
           puesto100:= nombre;
           end
         else
           if (tiempo>max2) then
              begin
              max2:= tiempo;
              puesto99:= nombre;
              end;
    writeln('El primer puesto fue para ',puesto1,' y el segundo puesto para ',puesto2);
    writeln('El anteultimo puesto fue para ',puesto99,' y el ultimo puesto para ',puesto100);
    readln;
end.
