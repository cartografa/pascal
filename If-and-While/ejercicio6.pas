{6. Realizar un programa que lea el numero de legajo y el promedio de
cada alumno de la facultad. La lectura finaliza cuando se ingresa el
legajo -1, que no debe procesarse. Al finalizar la lectura, informar:
Åõ La cantidad de alumnos leida
Åõ La cantidad de alumnos cuyo promedio supera 6.5
Åõ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5)
cuyo legajo sean menor al valor 2500.}



program ejercicio6;
var
   alumnos, legajo, promedioalto: integer;
   promedio: real;
begin
   alumnos:= 0;
   promedio:= 0;
   promedioalto:= 0;
   legajo:= 0;
   while (legajo<>-1) do
         begin
         writeln('Ingrese legajo de alumnx: ');
         readln(legajo);
         writeln('Ingrese promedio de alumnx: ');
         readln(promedio);
         alumnos:= alumnos+1;
         end;
         if (promedio>6.5) then
             begin
             if (promedio>8.5) then
                 promedio:= promedio+1
             end
             else
                 promedioalto:= promedioalto+1
         end;
   writeln('La cantidad de alumnxs es de: ', alumnos,'.');
   writeln('La cantidad de alumnxs con promedio mayor a 6.5 es de: ', promedioalto,'.');
   writeln('El porcentaje de alumnos destacados es de: ', (promedio/100)*alumnos,'.');
   readln;
end.
