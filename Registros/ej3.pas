{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
? Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
? CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}

program ejercicio3;

const
    UNESCO = 23.435;

type
    cadena25 = string[25];
    establecimiento = record
                      CUE: integer;
                      nombre: cadena25;
                      localidad: cadena25;
                      docentes: integer;
                      alumnxs: integer;
                      end;

procedure cargarDatos (var e: establecimiento);
begin
     writeln('Ingrese CUE:');
     readln(e.CUE);
     writeln('Ingrese nombre del establecimiento:');
     readln(e.nombre);
     writeln('Ingrese localidad:');
     readln(e.localidad);
     writeln('Ingrese cantidad de docentes:');
     readln(e.docentes);
     writeln('Ingrese cantidad de estudiantes:');
     readln(e.alumnxs);
end;

function proporcion (e: establecimiento): real;
begin
     proporcion:= (e.docentes / e.alumnxs);
end;

procedure maximos ( e: establecimiento;
                    var prop1: real;
                    var prop2: real;
                    var c1: integer;
                    var c2: integer;
                    var n1: cadena25;
                    var n2: cadena25);
var
   p: real;
begin
     p:= proporcion(e);
     if (p > prop1) then begin
        prop2:= prop1;
        prop1:= p;
        n2:= n1;
        n1:= e.nombre;
        c2:= c1;
        c1:= e.CUE
        end
        else if (p > prop2) then begin
             prop2:= p;
             n2:= e.nombre;
             c2:= e.CUE;
             end;
end;

var
   escuela: establecimiento;
   buenaProporcion1: real;
   buenaProporcion2: real;
   CUE1: integer;
   CUE2: integer;
   nombre1: cadena25;
   nombre2: cadena25;
   i: integer;
   contadorLP: integer;

begin
     buenaProporcion1:= UNESCO;
     contadorLP:= 0;
     for i:= 1 to 4 do begin
         cargarDatos (escuela);
         maximos(escuela, buenaProporcion1, buenaProporcion2, CUE1, CUE2, nombre1, nombre2);
         if (escuela.localidad = 'La Plata') and (proporcion (escuela) > UNESCO) then
            contadorLP:= contadorLP+1;
     end;
     writeln('Las escuelas con mejores proporciones entre docentes y alumnxs fueron: ');
     writeln('Numero 1', CUE1, ' ', nombre1);
     writeln('Numero 2', CUE2, ' ', nombre2);
     writeln('Las escuelas de La Plata que superaron la proporcion recomendada por la UNESCO fueron ', contadorLP);
     readln;
end.
