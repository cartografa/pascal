{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna
la cantidad de elementos de la lista que son múltiplos de A.}

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

function maximo (L: lista): integer;
var
   max: integer;
begin
    max:= -1;
    while (L <> NIL) do begin
          if (L^.num > max) then
             max:= L^.num;
          L:= L^.sig;
    end;
    maximo:= max;
end;


function minimo (L: lista): integer;
var
   min: integer;
begin
    min:= 9999999;
    while (L <> NIL) do begin
          if (L^.num < min) then
             min:= L^.num;
          L:= L^.sig;
    end;
    minimo:= min;
end;

{c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna
la cantidad de elementos de la lista que son múltiplos de A}

function multiplos (L: lista; valor: integer): integer;
var
   contador: integer;
begin
     contador:= 0;
     while (L <> NIL) do begin
           if ((L^.num mod valor) = 0) then
              contador:= contador + 1;
           L:= L^.sig;
     end;
     multiplos:= contador;
end;

{ PROGRAMA PRINCIPAL }


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
     writeln('-------------------------------');
     imprimirLista (pri);
     writeln('-------------------------------');
     writeln('El numero maximo es ', maximo(pri));
     writeln('EL numero minimo es ', minimo(pri));
     writeln('-------------------------------');
     writeln('Ingrese un valor para determinar la cantidad de multiplos');
     read(valor);
     writeln('La cantidad de multiplo de ', valor,' son ', multiplos(pri, valor));
     readln;
     readln;
end.
