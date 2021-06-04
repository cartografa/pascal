{Realizar un programa que lea y almacene la información de 400 alumnos ingresantes
a la Facultad de Informática de la UNLP en el año 2020. De cada alumno se lee:
nro de inscripción, DNI, apellido, nombre y año de nacimiento. Una vez leída y
almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad

9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}

program ejercicio9;

const
     dimF = 400;

type
    cadena20 = string[20];
    ingresantes = record
                  inscripcion: integer;
                  DNI: integer;
                  apellido: cadena20;
                  nombre: cadena20;
                  nacimiento: integer;
                  end;
    info = array [1..dimF] of ingresantes;

{modulo de carga de informacion}

procedure leerAlumno (var v: ingresantes);
begin
     writeln('Ingrese DNI: ');
     readln(v.DNI);
     if (v.DNI <> -1) then begin
        writeln('Ingrese nombre: ');
       readln(v[dimL].nombre);
       writeln('Ingrese apellido: ');
       readln(v[dimL].apellido);
       writeln('Ingrese numero de inscripcion: ');
       readln(v[dimL].inscripcion);
       writeln('Ingrese año de nacimiento: ');
       readln(v[dimL].nacimiento);
     end;
end

procedure cargarAlumnos (var v: info; var dimL: integer;);
var
   c: ingresantes;
begin
   leerAlumno (c);
   dimL:= 0;
   while (dimL < dimF) and (c.DNI <> -1) do
   begin
       dimL:= dimL + 1;
       v[dimL]:= c;
       LeerAlumno(c);
   end;
end;

{funcion para saber si todos los digitos del dni son pares}

function DNIPar (DNI: integer): boolean;
begin
     while (DNI mod 2 = 0) and (DNI <> 0) do
     begin
         DNI:= DNI DIV 10;
     end;
     if (DNI = 0) then DNIPar:= true
                  else DNIPar:= false;
end;

{nombre y apellido de los alumnos de mayor edad}

procedure mayores (DNI: integer; apellido: cadena20; nombre: cadena20;
                  var apellidoMax1: cadena20;
                  var apellidoMax2: cadena20;
                  var nombreMax1: cadena20;
                  var nombreMax2: cadena20;
                  var DNI1: integer;
                  var DNI2: integer);
begin
     if (DNI < DNI1) then
     begin
          apellidoMax2:= apellidoMax1;
          apellidoMax1:= apellido;
          nombreMax2:= nombreMax1;
          nombreMax1:= nombre;
          DNI2:= DNI1;
          DNI1:= DNI
          end
          else if (DNI < DNI2) then
          begin
               apellidoMax2:= apellido;
               nombreMax2:= nombre;
               DNI2:= DNI;
          end;
end;



var
   estudiantes: info;
   apellidoMax1: cadena20;
   apellidoMax2: cadena20;
   nombreMax1: cadena20;
   nombreMax2: cadena20;
   DNI1: integer;
   DNI2: integer;
   contadorPar: integer;
   i: integer;
   dimL: integer;

begin
     apellidoMax1:= ' ';
     nombreMax1:= ' ';
     DNI1:= 999999999;
     contadorPar:= 0;
     cargarVector(estudiantes);
     for i:=  1 to dimL do
     begin
          if (DNIPar(estudiantes[i].DNI)) then
             contadorPar:= contadorPar + 1;
          mayores (estudiantes[i].DNI, estudiantes[i].apellido, estudiantes[i].nombre,
                  apellidoMax1, apellidoMax2, nombreMax1, nombreMax2, DNI1, DNI2);
     end;
     writeln('El porcentaje de alumnos con DNI de digitos pares es de ', contadorPar/rango:2:2,'%');
     writeln('Los alumnos de mayor edad son: ');
     writeln(nombreMax1,' ', apellidoMax1);
     writeln(nombreMax2,' ', nombreMax2);
     readln;
     readln;
end.
