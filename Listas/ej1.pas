{program JugamosConListas;

type
    lista = ^nodo;

    nodo = record
         num : integer;
         sig : lista;
         end;

procedure armarNodo (var L: lista; v: integer);
var
   aux : lista;
begin
     new(aux);
     aux^.num := v;
     aux^.sig := L;
     L := aux;
end;

var
   pri : lista;
   valor : integer;

begin
     pri := nil;
     writeln(‘Ingrese un numero’);
     read(valor);
     while (valor <> 0) then begin
           armarNodo(pri, valor);
           writeln(‘Ingrese un numero’);
           read(valor);
     end;

. . . imprimir lista
end.

a. Indicar qué hace el programa.
// El programa arma una lista de numero enteros. Cada nuevo valor se
agrega adelante.

b. Indicar cómo queda conformada la lista si se lee la siguiente
secuencia de números: 10 21 13 48 0.
// La lista va a quedar conforma en 48 13 21 10

c. Implementar un módulo que imprima los números enteros guardados
en la lista generada.

d. Implementar un módulo que reciba la lista y un valor, e incremente
con ese valor cada dato de la lista.}


program JugamosConListas;

type
    lista = ^nodo;

    nodo = record
         num : integer;
         sig : lista;
         end;

procedure armarNodo (var L: lista; v: integer);
var
   aux : lista;
begin
     new(aux);
     aux^.num := v;
     aux^.sig := L;
     L := aux;
end;

procedure imprimirLista (L: lista);
begin
     while (L <> NIL) do begin
           writeln (L^.num);
           L:= L^.sig
     end
end;

procedure agregarValor (L: lista; v: integer);
{¡¡¡¡pasar por referencia hace perder el inicio de la lista!!!!!}
begin
     while (L <> NIL) do begin
           L^.num:= L^.num + v;
           L:= L^.sig;
     end
end;

var
   pri : lista;
   valor : integer;

begin
     pri := nil;
     writeln('Ingrese un numero');
     read(valor);
     while (valor <> 0) do begin
           armarNodo(pri, valor);
           writeln('Ingrese un numero');
           read(valor);
     end;
     writeln('-------------------------------');
     imprimirLista (pri);
     writeln('-------------------------------');
     writeln('Ingrese un valor a agregar');
     read(valor);
     agregarValor (pri, valor);
     imprimirLista (pri);
     readln;
     readln;
end.
