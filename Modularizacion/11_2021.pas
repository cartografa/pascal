{11. Realizar un programa modularizado que lea informacion de alumnos
de una facultad. Para cada alumno se lee: nro de inscripcion, apellido y nombre.
La lectura finaliza cuando se ingresa el alumno con nro de inscripcion 1200,
que debe procesarse. Se pide calcular e informar:
Åú Apellido de los dos alumnos con nro de inscripcion mas chico.
Åú Nombre de los dos alumnos con nro de inscripcion mas grande.
Åú Porcentaje de alumnos con nro de inscripcion par.}

program ejercicio11;

type
    cadena25 = string[25];

procedure LeerDatos (var apellido: cadena25; var nombre: cadena25; var inscripcion: integer);
begin
     writeln('Ingrese apellido: ');
     read(apellido);
     writeln('Ingrese nombre: ');
     read(nombre);
     writeln('Ingrese numero de inscripcion: ');
     read(inscripcion);
end;

procedure MasChicos (apellido: cadena25; inscripcion: integer;
                    var min1: integer; var min2: integer;
                    var apellidoMin1: cadena25; var apellidoMin2: cadena25);
begin
     if (inscripcion < min1) then
     begin
          min2:= min1;
          apellidoMin2:= apellidoMin1;
          min1:= inscripcion;
          apellidoMin1:= apellido;
     end
     else if (inscripcion < min2) then
          begin
               min2:= inscripcion;
               apellidoMin2:= apellido
          end;
end;

procedure MasGrandes (nombre: cadena25; inscripcion: integer;
                    var max1: integer; var max2: integer;
                    var nombreMax1: cadena25; var nombreMax2: cadena25);
begin
     if (inscripcion > max1) then
     begin
          max2:= max1;
          nombreMax2:= nombreMax1;
          max1:= inscripcion;
          nombreMax1:= nombre;
     end
     else if (inscripcion > max2) then
          begin
               max2:= inscripcion;
               nombreMax2:= nombre
          end;
end;

function EsPar (inscripcion: integer): boolean;
begin
     EsPar:= (inscripcion mod 2 = 0);
end;

var
   apellido, nombre: cadena25;
   apellidoMin1, apellidoMin2: cadena25;
   nombreMax1, nombreMax2: cadena25;
   numero, cantAlumnxs, cantPar: integer;
   max1, max2, min1, min2: integer;

begin
     {inicializaciÛn}
     max1:= 0;
     min1:= 99999999;
     cantAlumnxs:= 0;
     cantPar:= 0;
     apellidoMin1:= '?';
     nombreMax1:= '?';

     repeat
     LeerDatos (apellido, nombre, numero);
     cantAlumnxs:= cantAlumnxs + 1;
     MasChicos(apellido, numero, min1, min2, apellidoMin1, apellidoMin2);
     MasGrandes(nombre, numero, max1, max2, nombreMax1, nombreMax2);
     if (esPar(numero)) then
        cantPar:= cantPar + 1;
     until (numero = 1200);

     {informes}
     writeln('Los apellidos de lxs dos alumnxs con numero de inscripcion mas chico son: ',
     apellidoMin1, ' y ', apellidoMin2,'.');
     writeln('Los nombres de lxs dos alumnxs con numero de inscripcion mas grande son: ',
     nombreMax1, ' y ', nombreMax2,'.');
     writeln('El porcentaje de alumnos con numero de inscripcion par es de: ',(cantPar*100)/cantAlumnxs,'%.');
     readln;
end.
