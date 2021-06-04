{1. a. Dado un vector de enteros de a lo sumo 500 valores,
realice un módulo que reciba dicho vector y un valor n y
retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora
que el vector se encuentra ordenado de manera ascendente.}

program ej1;

const
     dimf = 500;

type
    vector = array [1..dimF] of integer;

{-------------------------------------------------------}
{                  modulo de carga                      }
{-------------------------------------------------------}

procedure cargaVector (var v: vector; var dl: integer);
var
   num: integer;
begin
     dl:= 0;
     read(num);
     while (num <> 0) and (dl < 500) do begin
           dl:= dl + 1;
           v[dl]:= num;
           read(num);
     end;
end;

{-------------------------------------------------------}
{                modulo de carga ordenada               }
{-------------------------------------------------------}

procedure cargaOrdenada (var v: vector; var dl: integer);
var
   i: integer;
begin
     dl:= 0;
     for i:= 1 to dimF do begin
         dl:= dl + 1;
         v[dl]:= dl
     end;
end;

{-------------------------------------------------------}
{       a) modulo de búsqueda (lineal-secuencial)       }
{-------------------------------------------------------}

{version sin booleano
function busqueda (v: vector; x: integer; dl: integer): integer;
var
  pos: integer;
begin
     pos:= 1;
     while (pos <= dl) and (v[pos] <> x) do
          pos:= pos+1;
     if (v[pos] = x) then busqueda:= pos;
     else busqueda:= 0;
end;}

{version con booleano}

function busqueda (v: vector; x: integer; dl: integer): integer;
var
  pos: integer;
  exito: boolean;
begin
     pos:= 1;
     exito:= false;
     while (pos <= dl) and (not exito) do
           if (v[pos] = x) then exito:= true
                           else pos:= pos+1;
     if (not exito) then busqueda:= 0;
     busqueda:= pos;
end;

{-------------------------------------------------------}
{       a) modulo de búsqueda de arreglo ordenado       }
{-------------------------------------------------------}

{TIPO SECUENCIAL OPTIMIZADA}

function busquedaSO (v: vector; x: integer; dl: integer): integer;
var
   pos: integer;
begin
     pos:= 1;
     while (pos <= dl) and (x > v[pos]) do
           pos:= pos + 1;
     if (pos > dl) or (x < v[pos]) then pos:= 0;
     busquedaSo:= pos;
end;

{TIPO BINARIA O DICOTOMICA}

function busquedaBin (v: vector; x: integer; dl: integer): integer;
var
   comienzo: integer;
   fin: integer;
   medio: integer;
begin
     comienzo:= 1;
     fin:= dl;
     medio:= (comienzo + fin) div 2;
     while (comienzo <= fin) and (x <> v[medio]) do begin
           if (x < v[medio]) then fin:= medio - 1
                             else comienzo:= medio + 1;
           medio:= (comienzo + fin) div 2;
     end;
     if comienzo <= fin then busquedaBin:= medio
                        else busquedaBin:= 0;
end;


var
   v: vector;
   dimL: integer;
   x: integer;

begin
     {cargaVector (v, dimL);}
     cargaOrdenada (v, dimL);
     writeln('Ingrese numero de busqueda');
     readln(x);
     writeln('El resultado con busquedaSO es ', busquedaSO(v, x, dimL));
     writeln('El resultado con busquedaBin es ', busquedaBin(v, x, dimL));
     readln;
end.
