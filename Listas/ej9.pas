{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:

a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma
se encuentra ordenada, o false en caso contrario.

b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina
dicho valor de la lista (si existe). Nota: la lista podría no estar ordenada.

c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B,
y retorna una nueva lista con todos los elementos de la lista L mayores que
A y menores que B.

d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista
L se encuentra ordenada de manera ascendente.

e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista
L se encuentra ordenada de manera descendente.}


program ej9;

type
    lista = ^nodo;

    nodo = record
         num : integer;
         sig : lista;
         end;


{ARMA NODO AGREGANDO ADELANTE}

procedure armarNodo (var L: lista; v: integer);
var
   aux : lista;
begin
     new(aux);
     aux^.num := v;
     aux^.sig := L;
     L := aux;
end;


{ARMA NODO ORDENADO}

procedure armarOrdenado (var L: lista; v: integer);
var
   nue : lista;
   act : lista;
   ant : lista;
begin
     new (nue);
     nue^.num:= v;
     act:= L;
     ant:= L;
     while (act <> nil) and (act^.num < v) do
     begin
          ant:= act;
          act:= act^.sig;
     end;
     if (ant = act) then L:= nue
                    else ant^.sig:= nue;
     nue^.sig:= act;
end;

{EstáOrdenada: recibe la lista como parámetro y retorna true si la misma
se encuentra ordenada, o false en caso contrario}

function estaOrdenada (L: lista): boolean;
var
   act: integer;
begin
     act:= L^.num;
     while (L <> nil) and (act <= L^.num) do
     begin
          act:= L^.num;
          L:= L^.sig;
     end;
     if (L <> nil) then estaOrdenada:= false
                   else estaOrdenada:= true;
end;

{Eliminar: recibe como parámetros la lista y un valor entero, y elimina
dicho valor de la lista (si existe)}

procedure eliminar (var L: lista; v: integer; var exito: boolean);
var
   ant : lista;
   act : lista;
begin
     exito := false;
     act := L;
     while (act <> nil) and (act^.num <> v) do
     begin
          ant := act;
          act := act^.sig;
     end;
     if (act <> nil) then begin
             exito:= true;
             if (act = l) then l := act^.sig
                          else ant^.sig := act^.sig;
             dispose(act);
     end;
end;

{c. Sublista: recibe como parámetros la lista L y dos valores enteros
A y B, y retorna una nueva lista con todos los elementos de la lista L
mayores que A y menores que B.}

procedure sublista (L: lista; A, B: integer; subL: lista);
begin
     subL:= nil;
     while (L <> nil) do begin
           if (L^.num > A and L^.num < B) then
              armarNodo (subL, L^.num);
           L:= L^.sig;
     end;
end;

{d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista
L se encuentra ordenada de manera ascendente.}

procedure sublistaConOrdenadaAscendente (L: lista; A, B: integer; subL: lista);
begin
     subL:= nil;
     repeat


{IMPRIMIR LISTA}

procedure imprimirLista (L: lista);
begin
     while (L <> NIL) do begin
           writeln (L^.num);
           L:= L^.sig
     end
end;


{PROGRAMA PRINCIPAL}

var
   pri : lista;
   valor : integer;
   A: integer;
   B: integer;
   sublista: lista;

begin
     pri := nil;
     writeln('Ingrese un numero');
     read (valor);
     while (valor <> 0) do begin
           armarOrdenado (pri, valor);
           writeln ('Ingrese un numero');
           read (valor);
     end;
     writeln('-----------------------');
     imprimirLista (pri);
     writeln('-----------------------');
     if (estaOrdenada(pri)) then
        writeln('La lista esta ordenada')
     else
        writeln('La lista no esta ordenada');
     readln;
     readln;
end.
