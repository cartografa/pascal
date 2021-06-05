{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas
las sondas espaciales lanzadas al espacio en la última década. De cada sonda
se conoce su nombre, duración estimada de la misión (cantidad de meses que
permanecerá activa), el costo de construcción, el costo de mantenimiento mensual
y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías:
1. radio;
2. microondas;
3. infrarrojo;
4. luz visible;
5. ultravioleta;
6. rayos X;
7. rayos gamma

Realizar un programa que lea y almacene la información de todas las sondas
espaciales. La lectura finaliza al ingresar la sonda llamada “GAIA”, que
debe procesarse.

Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción
y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro
electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio
de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio
entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse una
 única vez.}


program ejemplo;

type
    cadena20 = string[20];
    espectro = array [1..7] of integer;
    sonda = record
          nombre: cadena20;
          mesesActiva: integer;
          costoConstruccion: real;
          costoMantenimiento: real;
          rango: integer;
          end;
    lista = ^nodo;
    nodo = record
         dato: sonda;
         sig: lista;
         end;

{INICIALIZAR VECTOR CONTADOR}

procedure inicializar (var e: espectro);
var
   i: integer;
begin
     for i:= 1 to 7 do
         e[i]:= 0;
end;

{CARGAR UN REGISTRO SONDA}

procedure cargarSonda (var s: sonda);
begin
     writeln('Ingrese nombre de la sonda: ');
     readln(s.nombre);
     writeln('Ingrese duracion de la mision: ');
     readln(s.mesesActiva);
     writeln('Ingrese costo de construccion: ');
     readln(s.costoConstruccion);
     writeln('Ingrese costo mensual de mantenimiento: ');
     readln(s.costoMantenimiento);
     writeln('Ingrese rango de espectro en estudio: ');
     readln(s.rango);
end;

{AGREGAR EL NUEVO DATO A LA LISTA}

procedure agregarAtras (var l: lista; var ult: lista; s: sonda);
var
   nue: lista;
begin
     new(nue);
     nue^.dato:= s;
     nue^.sig:= nil;
     if (l <> nil) then
           ult^.sig:= nue
        else
            l:= nue;
     ult:= nue;
end;

{CARGA DE DATOS Y PROCESAMIENTO DE INFORMACION}

procedure cargarLista (var l: lista; var ult: lista; var e: espectro;
                       var sumaTotal: real; var cantSondas: integer;
                       var duracionTotal: integer);
var
   s: sonda;
begin
     inicializar(e);
     sumaTotal:= 0;
     cantSondas:= 0;
     duracionTotal:= 0;
     cargarSonda(s);
     repeat
           cantSondas:= cantSondas + 1;
           e[s.rango]:= e[s.rango] + 1;
           sumaTotal:= sumaTotal + s.costoConstruccion;
           duracionTotal:= duracionTotal + s.mesesActiva;
           agregarAtras(l, ult, s);
           cargarSonda(s);
     until (s.nombre = 'GAIA');
end;

{RECORRIDO DE LISTAS Y PUNTOS A, B, C Y D
a. El nombre de la sonda más costosa (considerando su costo de construcción
y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro
electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio
de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio
entre todas las sondas.}

procedure recorrerInformar (l: lista; e: espectro; sumaTotal: real; cantSondas: integer;
                           duracionTotal: integer);
var
   nombreMax: cadena20;
   costoMax: real;
   aux: real;
   cantMasDuracionPromedio: integer;
   i: integer;
begin
     costoMax:= -1;
     cantMasDuracionPromedio:= 0;
     nombreMax:= '';
     while (l <> nil) do
     begin
          {punto a}
          aux:= l^.dato.costoConstruccion + (l^.dato.costoMantenimiento * l^.dato.mesesActiva);
          if (aux > costoMax) then
          begin
             costoMax:= aux;
             nombreMax:= l^.dato.nombre;
          end;
          {punto c}
          if (l^.dato.mesesActiva > (duracionTotal div cantSondas)) then
             cantMasDuracionPromedio:= cantMasDuracionPromedio + 1;
          {punto d}
          if (l^.dato.costoConstruccion > (sumaTotal / cantSondas)) then
          begin
               writeln(l^.dato.nombre,' supera el costo promedio de construccion.');
               writeln('------------------------------------------------------');
          end;
          l:= l^.sig;
      end;
          writeln('La sonda mas costosa es ', nombreMax);
          writeln('-----------------------------------------------');
          writeln('La cantidad de sondas que superan la duracion promedio: ', cantMasDuracionPromedio);
          writeln('-----------------------------------------------');
      for i:= 1 to 7 do
          writeln('Cantidad de sondas en rango ', i,': ', e[i]);
end;




var
   listaSondas: lista;
   ultima: lista;
   vectorContador: espectro;
   sumaTotal: real;
   cantSondas: integer;
   duracionTotal: integer;

begin
     cargarLista (listaSondas, ultima, vectorContador, sumaTotal, cantSondas, duracionTotal);
     recorrerInformar(listaSondas, vectorContador, sumaTotal, cantSondas, duracionTotal);
     readln;
     readln;
end.
