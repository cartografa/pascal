{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo
para que los elementos de la lista queden ordenados de manera ascendente
(insertar ordenado).}

program ej8;

type
    lista = ^nodo;

    nodo = record
         num : integer;
         sig : lista;
         end;

procedure armarNodo (var L: lista; v: integer);
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

procedure imprimirLista (L: lista);
begin
     while (L <> NIL) do begin
           writeln (L^.num);
           L:= L^.sig
     end
end;

var
   pri : lista;
   valor : integer;

begin
     pri := nil;
     writeln('Ingrese un numero');
     read (valor);
     while (valor <> 0) do begin
           armarNodo (pri, valor);
           writeln ('Ingrese un numero');
           read (valor);
     end;
     writeln('-----------------------');
     imprimirLista (pri);
     readln;
     readln;
end.

