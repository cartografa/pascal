{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000).
De cada alumno se conoce nro de alumno, apellido y nombre y cantidad de
asistencias a clase. Dicha información se encuentra ordenada por nro de
alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno
recibido por parámetro. El alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo
elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del
vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de
 asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados
en los incisos previos con datos leídos de teclado.}


program ej4;

const
     dimF = 100;
     cadena25 = string[25];

type
     est = record
         num: integer;
         apellido: cadena25;
         nombre: cadena25;
         asistencias: integer;
         end;
     alumnxs = array [1..dimF] of est;

{------------------ CARGA DEL VECTOR --------------------------}

procedure cargarAlumnx (var a: est);
begin
     writeln('Ingrese numero de alumnx');
     readln(a.num);
     if (a.num <> -1) then begin
        writeln('Ingrese apellido');
        readln(a.apellido);
        writeln('Ingrese nombre');
        readln(a.nombre);
        writeln('Ingrese numero de asistencias');
        readln(a.asistencias);
     end;
end;

procedure cargaVector (var alu: alumnxs; var dimL: integer);
var
   aux: est;
begin
     dimL:= 0;
     cargarAlumnx (aux);
     while (aux.num <> -1) and (dimL < dimF) do begin
           dimL:= dimL + 1;
           v[dimL]:= aux;
           cargarAlumnx (aux);
     end;
end;


{-----------------------------------------------}
{a. Un módulo que retorne la posición del alumno
con un nro de alumno recibido por parámetro.
El alumno seguro existe.------------------------}

function buscarPos (a: alumnxs; dimL: integer; x: integer): integer;
var
   comienzo: integer
   final: integer;
   medio: integer;
begin
   comienzo:= 1;
   final:= dimL;
   medio:= (comienzo + final) div 2;
   while (comienzo <= final) and (x <> a[medio]) do begin
         if (x < v[medio]) then fin:= medio - 1;
                           else comienzo:= medio + 1;
         medio:= (comienzo + fin) div 2;
   end;
   if (comienzo <= fin) then buscarPos:= medio;
                        else buscarPos:= 0;
end;

{------------------------------------------------}
{b. Un módulo que reciba un alumno y lo inserte  }
{en el vector.                                   }
{------------------------------------------------}

procedure insertarElemOrdenado (var a: alumnxs, var dimL: integer;
                                alumno: est; var exito: boolean;

   function DeterminarPos (alumno: est; a: alumnxs; dimL: integer): integer;
      var
        pos: integer;
      begin
        pos:= 1;
        while (pos <= dimL) and (alumno.num > a[pos].num) do
              pos:= pos+1;
        DeterminarPos:= pos;
      end;

   procedure Insertar (var a: alumnxs; var dimL; pos: integer; alumno: est);
     var
        i: integer;
     begin
          for i:= dimL downto pos do
              a[i+1]:= v[i];
          v[pos]:= alumno;
          dimL:= dimL + 1;
     end;

var
   pos: integer;
begin
     exito:= false;
     if (dimL < dimF) then begin
        pos:= DeterminarPos (alumno, a, dimL);
        Insertar (a, dimL, pos, alumno);
        exito:= true;
     end;
end;




{------------------------------------------------------------------------}
{c. Un módulo que reciba la posición de un alumno dentro del vector y lo
elimine.}
{------------------------------------------------------------------------}

procedure BorrarPos (var a: alumnxs; var dimL: integer; pos: integer;
                     var exito: boolean);
var
   i: integer;
begin
     exito:= false;
     if (pos >= 1 and pos <= dimL) then
     begin
          exito:= true;
          for i:= pos+1 to dimL do
              a[i-1]:= a[i];
          dimL:= dimL - 1;
     end;
end;

{------------------------------------------------------------------------}
{d. Un módulo que reciba un nro de alumno y elimine dicho alumno del
vector}
{------------------------------------------------------------------------}

procedure borrarNumero (var a: alumnxs; var dimL: integer; numero: integer);
var
   pos: integer;
   exito: boolean;
begin
     pos:= buscarPos (a, dimL, numero)
     BorrarPos (a, dimL, pos, exito);
     if (exito:= true) then writeln ('Se borro ', numero,' correctamente.');
end;


{------------------------------------------------------------------------}
{e. Un módulo que elimine del vector todos los alumnos con cantidad de
 asistencias en 0.}
{------------------------------------------------------------------------}


procedure BorrarPosMod (var a: alumnxs; var dimL: integer; pos: integer);
var
   i: integer;
begin
     if (pos >= 1 and pos <= dimL) then
     begin
          for i:= pos+1 to dimL do
              a[i-1]:= a[i];
          dimL:= dimL - 1;
     end;
end;

procedure eliminar0asistencias (var a: alumnxs; var dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do begin
         if (v[i].asistencias = 0) then borrarPosMod (a, dimL, i);
     end;
end;


{------------------------------------------------------------------------}
{                           PROGRAMA PRINCIPAL                           }
{------------------------------------------------------------------------}

var
   alumnis:= alumnxs;
   dimL:= integer;
   exito: boolean;
   posicion: integer;
   numero: integer;

begin
     cargaVector (alumnis, dimL);



end.
