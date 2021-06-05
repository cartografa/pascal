{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}

program ejemplo;
type
    palabras = string[50];
var
    nombre: palabras;
    nota, aprobados, siete: integer;
begin
    aprobados:= 0;
    siete:= 0;
    repeat
          writeln('Ingrese nombre del alumnz: ');
          readln(nombre);
          writeln('Ingrese nota: ');
          readln(nota);
          if nota>=8 then
             aprobados:= aprobados + 1
          else
             if nota=7 then
             siete:= siete + 1
     until (nombre='Zidane Zinedine');
     writeln('La cantidad de alumnos aprobados es de: ', aprobados);
     writeln('La cantidad de alumnos que obtuvieron 7 es de: ', siete);
     readln;
end.
