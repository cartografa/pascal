{En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}


program ejemplo;

const
     dimF = 53;
     rango = 1..4;
     cadena30 = string[30];

type
    galaxia = record
            nombre: cadena30;
            tipo: rango;
            masa: real;
            distancia: real;
            end;
    gLocal = array [1..dimF] of galaxia;
    opcionTipo = array [rango] of integer;


{---------------------------------------------}
{             CARGA DEL VECTOR                }
{---------------------------------------------}

procedure cargaVector (var g: gLocal);
var
   i: integer;
begin
     inicializar (g.tipo);
     for i:= 1 to dimF do begin
         writeln('Ingrese nombre de la galaxia');
         readln(g[i].nombre);
         writeln('Ingrese tipo de galaxia');
         readln(g[i].tipo);
         writeln('Ingrese su masa');
         readln(g[i].masa);
         writeln('Ingrese distancia desde la Tierra');
         readln(g[i].distancia);
         writeln('--------------------------------');
     end;
end;


{---------------------------------------------}
{   a) la cantidad de galaxias de cada tipo.  }
{---------------------------------------------}

procedure inicializar (var c: opcionTipo);
var
   i: rango;
begin
     for i:= 1..4 do
         c[i]:= 0;
end;

procedure guardarTipo (num; var c: opcionTipo);
begin
     case num of
          1: c[num]:= c[num] + 1;
          2: c[num]:= c[num] + 1;
          3: c[num]:= c[num] + 1;
          4: c[num]:= c[num] + 1;
      end;
end;

procedure informarTipo (o: opcionTipo);
var
   i: rango;
begin
     for i: 1..4 do begin
         writeln('La cantidad de galaxias de tipo 1 son ', o[1]);
         writeln('La cantidad de galaxias de tipo 2 son ', o[2]);
         writeln('La cantidad de galaxias de tipo 3 son ', o[3]);
         writeln('La cantidad de galaxias de tipo 4 son ', o[4]);
     end;
end;


{------------------------------------------------------------}
{ b) la masa total acumulada de las 3 galaxias principales   }
{ (la Vía Láctea, Andrómeda y Triángulo) y el porcentaje que }
{ esto representa respecto a la masa de todas las galaxias.  }
{------------------------------------------------------------}

procedure calcularMasas (g: gLocal; var masa3: real; var porcentaje: real);
var
   i: integer;
   masaTotal: real;
begin
     masa3:= 0;
     masaTotal:= 0;
     for i:= 1..dimF do begin
         if (g[i].nombre = 'Via Lactea' or g[i].nombre = 'Andromeda' or g[i].nombre = 'Triangulo') do
            masa3:= masa3 + g[i].masa;
         masaTotal:= masaTotal + g[i].masa;
     end;
     porcentaje:= masaTotal / masa3;
end;


{-----------------------------------------------------------------------------}
{ la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc }
{-----------------------------------------------------------------------------}

function gNoIrregulares (g: gLocal): integer;
var
   i: integer;
   contador: integer;
begin
     contador:= 0;
     for i:= 1 to dimF do begin
         if (not(g.tipo = 4) and (g.distancia < 1000)) then
            contador:= contador + 1;
     end;
     gNoIrregulares:= contador;
end;


{-----------------------------------------------------------------------------}
{         d) el nombre de las dos galaxias con mayor masa y el de las dos     }
{                         galaxias con menor masa.                            }
{-----------------------------------------------------------------------------}

procedure maxMin (g: gLocal);
var
   masaMax1, masaMax2, masaMin1, masaMin2: real;
   max1, max2, min1, min2: cadena30;
begin
     max1:= '';
     min1:= '';
     masaMax1:= -9999999
     masaMin1:= 99999999
     for i:= 1 to dimF do begin
         if (g[i].masa > max1) then begin
            masaMax2:= masaMax1;
            max2:= max1;
            masaMax1:= g[i].masa;
            max1:= g[i].nombre;
         end
         else if (g[i].masa > max2) then begin
              masaMax2:= g[i].masa;
              max2:= g[i].nombre;
         end;
         if (g[i].masa < min1) then begin
            masaMin2:= masaMin1;
            min2:= min1;
            masaMin1:= g[i].masa;
            min1:= g[i].nombre;
         end
         else if (g[i].masa < min2) then begin
              masaMin2:= g[i].masa;
              min2:= g[i].nombre;
         end;
      end;
      writeln('-------------------------------------------------------');
      writeln('Las dos galaxias con mayor masa son ', max1,' y ', max2);
      writeln('-------------------------------------------------------');
      writeln('Las dos galaxias con menor masa son ', min1,' y ', min2);
end;


{---------------------------------------------}
{            PROGRAMA PRINCIPAL               }
{---------------------------------------------}

var
   grupoLocal: gLocal;
   masaGalaxiasPrincipales: real;
   poncentajeGP: real;
   contadorTipos: opcionTipo;

begin


end.
