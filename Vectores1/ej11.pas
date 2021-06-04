{El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad
de comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada
la lectura, el programa debe procesar los datos e informar:

a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

{ejemplo de acceso: fotos[i].titulo}

program ej11;

const
     dimF = 6;

type
    cadena30 = string[30];
    foto = record
         titulo: cadena30;
         autor: cadena30;
         meGusta: integer;
         clics: integer;
         comentarios: integer;
         end;
    vectorFoto = array [0..dimF] of foto;

{---------------------------------------------}
{             CARGA DEL VECTOR                }
{---------------------------------------------}
procedure cargaDeFotos (var f: vectorFoto);
var
   i: integer;
begin
     for i:= 1 to dimF do begin
         writeln('Ingrese titulo de la foto');
         readln(f[i].titulo);
         writeln('Ingrese autor de la foto');
         readln(f[i].autor);
         writeln('Ingrese cantidad de Me Gusta');
         readln(f[i].meGusta);
         writeln('Ingrese cantidad de clics');
         readln(f[i].clics);
         writeln('Ingrese cantidad de comentarios');
         readln(f[i].comentarios);
         writeln('--------------------------------');
     end;
end;


{---------------------------------------------}
{     a) titulo de la foto más vista          }
{---------------------------------------------}

function fotoMasVista (f: vectorFoto): cadena30;
var
   i: integer;
   maxClics: integer;
   maxTitulo: cadena30;
begin
     maxClics:= 0;
     maxTitulo:= '';
     for i:= 1 to dimF do begin
         if (f[i].clics > maxClics) then begin
            maxClics:= f[i].clics;
            maxTitulo:= f[i].titulo;
         end;
     end;
     fotoMasVista:= maxTitulo;
end;


{------------------------------------------------------}
{ b) cantidad de me gusta en las fotos de Art Vandelay }
{------------------------------------------------------}

function cantMeGusta (f: vectorFoto): integer;
var
   i: integer;
   contador: integer;
begin
     contador:= 0;
     for i:= 1 to dimF do begin
         if (f[i].autor = 'Art Vandelay') then
            contador:= contador + f[i].meGusta;
     end;
     cantMeGusta:= contador;
end;

{----------------------------------------------------}
{ c) cantidad de comentarios en cada una de la fotos }
{----------------------------------------------------}

procedure comentarios (f: vectorFoto);
var
   i: integer;
begin
     for i:= 1 to dimF do
         writeln('La foto numero ', i,' tiene ',f[i].comentarios,' comentario(s)');
end;


{---------------------------------------------}
{            PROGRAMA PRINCIPAL               }
{---------------------------------------------}

var
   fotos: vectorFoto;

begin
     cargaDeFotos(fotos);
     writeln('La foto mas vista es ', fotoMasVista(fotos));
     writeln('--------------------------------------------------------------------------');
     writeln('La cantidad total de Me Gusta en la fotos de Art Vandelay: ', cantMeGusta(fotos));
     writeln('--------------------------------------------------------------------------');
     comentarios(fotos);
     readln;
end.
