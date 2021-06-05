{3. Utilizando el programa del ejercicio 1, realizar los
siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se
guarden en la lista en el orden en que fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se
guarden en la lista en el orden en que fueron ingresados, manteniendo
un puntero al último ingresado.}


program JugamosConListas;

type
    lista = ^nodo;

    nodo = record
         num : integer;
         sig : lista;
         end;

{procedure armarNodo (var L: lista; v: integer);
var
   aux : lista;
begin
     new(aux);
     aux^.num := v;
     aux^.sig := L;
     L := aux;
end;}

procedure agregarAtras (var L: lista; var ult: lista; v: integer);
var
   nue: lista;
begin
     new (nue);
     nue^.num:= v;
     nue^.sig:= nil;
     if (L <> nil) then
        ult^.sig:= nue
     else
        L:= nue;
     ult:= nue;
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
   ult : lista;

begin
     pri := nil;
     ult := nil;
     writeln('Ingrese un numero');
     read(valor);
     while (valor <> 0) do begin
           agregarAtras(pri, ult, valor);
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
