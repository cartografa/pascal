{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado
los criterios para financiar proyectos de investigación avanzada.
Para los proyectos de sondas espaciales vistos en el ejercicio anterior,
se han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere
el costo de construcción.

A partir de la información disponible de las sondas espaciales (la lista
generada en ejercicio 6), implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y
retorne si cumple o no con los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese
la lista de sondas de la ESA y retorne dos listados, uno con los proyectos
que cumplen con los nuevos criterios y otro con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales
e informe la cantidad y el costo total (construcción y mantenimiento) de los
proyectos que no serán financiados por H2020. Para ello, utilice el módulo
realizado en b.}

program ej7;

type
    cadena20 = string[20];
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

procedure agregarAtras (var l: lista;
                        var ult: lista;
                        s: sonda);
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

procedure cargarLista (var l: lista; var ult: lista);
var
   s: sonda;
begin
     cargarSonda(s);
     repeat
           agregarAtras(l, ult, s);
           cargarSonda(s);
     until (s.nombre = 'GAIA');
end;

{MODULO QUE VALIDE SI CUMPLE CON NUEVOS CRITERIOS}

function cumple(s: sonda): boolean;
begin
     if ((s.costoMantenimiento * s.mesesActiva) > s.costoConstruccion) then
        cumple:= true
     else
        cumple:= false;
end;

{MODULO AGREGAR ADELANTE}

procedure agregarAdelante (var l: lista; s: sonda);
var
   nue: lista;
begin
     new (nue);
     nue^.dato:= s;
     nue^.sig:= l;
     l:= nue;
end;


{MODULO QUE RETORNE DOS LISTADOS SEGUN CRITERIO}

procedure clasificacion (l: lista; var listaSI: lista; var listaNO: lista);
begin
     while (l <> nil) do
     begin
          if (cumple(l^.dato)) then
             agregarAdelante (listaSI, l^.dato)
          else
             agregarAdelante (listaNO, l^.dato);
          l:= l^.sig;
     end;
end;

{CANTIDAD Y COSTO TOTAL (construcción y mantenimiento) DE LOS PROYECTOS
NO FINANCIADOS}

procedure negativo (l: lista);
var
   cantidad: integer;
   costoTotal: real;
begin
     cantidad:= 0;
     costoTotal:= 0;
     while (l <> nil) do
     begin
          cantidad:= cantidad + 1;
          costoTotal:= l^.dato.costoConstruccion + (l^.dato.costoMantenimiento * l^.dato.mesesActiva) + costoTotal;
          l:= l^.sig;
     end;
     writeln('La cantidad de proyectos rechazados fueron ', cantidad);
     writeln('El costo total de los proyectos rechazados es de ', costoTotal:2:2);
end;


{PROGRAMA PRINCIPAL}

var
   listaSondas: lista;
   listaSI: lista;
   listaNO: lista;
   ultima: lista;

begin
     listaSondas:= nil;
     listaSI:= nil;
     listaNO:= nil;
     cargarLista (listaSondas, ultima);
     clasificacion (listaSondas, listaSI, listaNO);
     negativo(listaNO);
     readln;
end.


