{Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo
500 elementos. La lectura finaliza cuando se lee el nombre ‘ZZZ’,
que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program ej2;

const
     dimF = 500;

type
    cadena30 = string[30];
    alumnes = array [1..dimF] of cadena30;

{-----------------------------------------------------------------}
{                     a)  modulo de carga                         }
{-----------------------------------------------------------------}

procedure cargaVector (var n: alumnes; var dl: integer);
var
   aux: cadena30;
begin
     dl:= 0;
     writeln('Ingrese nombre de alumne');
     read(aux);
     while (dl < dimF) and (aux <> 'ZZZ') do begin
           dl:= dl + 1;
           n[dl]:= aux;
           read(aux);
     end;
end;



{-----------------------------------------------------------------}
{  b. Lea un nombre y elimine la primera ocurrencia en el vector. }
{-----------------------------------------------------------------}

{BUSCAR UN ELEMENTO DETERMINADO}
function buscarPos (elem: cadena30; n: alumnes; dl: integer): integer;
var
   pos: integer;
   exito: boolean;
begin
     pos:= 1;
     exito:= false;
     while (pos <= dl) and (not exito) do
           if (n[pos] = elem) then exito:= true
                              else pos:= pos+1;
     if (exito = false) then pos:= 0;
     buscarPos:= pos;
end;

{BORRAR UNA POSICION}

procedure borrarPosMod (var n: alumnes; var dl: integer; pos: integer);
var
   i: integer;
begin
     for i:= pos + 1 to dl do
         n[i-1]:= n[i];
     dl:= dl - 1;
end;


{BORRAR UN ELEMENTO DETERMINADO}
procedure borrarNombre (var n: alumnes; var dl: integer; elem: cadena30;
                       var exito: boolean);

var
   pos: integer;
begin
     exito:= false;
     pos:= buscarPos (elem, n, dl);
     if (pos <> 0) then begin
        borrarPosMod (n, dl, pos);
        exito:= true;
        end;
end;

{-----------------------------------------------------------------}
{    c)Lea un nombre y lo inserte en la posición 4 del vector.    }
{-----------------------------------------------------------------}

procedure insertarPos (var n:alumnes; var dl: integer; elem: cadena30;
                      pos: integer; var exito: boolean);
var
   i: integer;
begin
     exito:= false;
     if (dl < dimF) and ((pos >=1) and (pos <= dl)) then
     begin
          exito:= true;
          for i:= dl downto pos do
              n[i+1]:= n[i];
          n[pos]:= elem;
          dl:= dl+1;
     end
end;

procedure insertarPos4 (var n: alumnes; var dl: integer);
var
   exito: boolean;
   pos: integer;
   elem: cadena30;
begin
     pos:= 4;
     writeln('Ingrese nombre a insertar en la posicion 4');
     readln(elem);
     insertarPos (n, dl, elem, pos, exito);
     if (exito) then writeln('La inserción fue exitosa');
end;



{-----------------------------------------------------------------}
{          d. Lea un nombre y lo agregue al vector.               }
{-----------------------------------------------------------------}

procedure agregar (var n: alumnes; var dl:integer; elem: cadena30;
                   var exito: boolean);
begin
     exito:= false;
     if (dl < dimF) then begin
        exito:= true;
        dl:= dl+1;
        n[dl]:= elem;
     end;
end;



{-----------------------------------------------------------------}
{                       PROGRAMA PRINCIPAL                        }
{-----------------------------------------------------------------}

var
   nombres: alumnes;
   dimL: integer;
   dato: cadena30;
   exito: boolean;
   elemento: cadena30;

begin
     cargaVector (nombres, dimL);
     writeln('Escriba nombre a borrar');
     readln(elemento);
     borrarNombre (nombres, dimL, elemento, exito);
     insertarPos4 (nombres, dimL);
     writeln('Escriba nombre a agregar');
     readln(elemento);
     agregar (nombres, dimL, elemento, exito);
     writeln('El nombre en la posicion 4 es ', nombres[4]);
     writeln('En nombres[dimL] esta ', nombres[dimL]);
     readln;
     readln;

end.
