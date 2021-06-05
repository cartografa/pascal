{5. Realizar un programa que lea y almacene la información de productos
de un supermercado. De cada producto se lee: código, descripción,
stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la
información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos
tres dígitos pares.
c. Código de los dos productos más económicos.}

program ej5;

type
    cadena40 = string[40];
    producto = record
             cod: integer;
             descripcion: cadena40;
             stockActual: integer;
             stockMin: integer;
             precio: real;
             end;
    lista = ^nodo;
    nodo = record
         dato: producto;
         sig: lista;
         end;

{------------------------------------}

{LEER PRODUCTO}
procedure leerProducto (var p: producto);
begin
     writeln('Ingrese codigo:');
     readln(p.cod);
     if (p.cod <> -1) then
     begin
        writeln('Ingrese descripcion del producto:');
        readln(p.descripcion);
        writeln('Ingrese stock actual:');
        readln(p.stockActual);
        writeln('Ingrese stock minimo:');
        readln(p.stockMin);
        writeln('Ingrese precio:');
        readln(p.precio);
     end;
end;


{AGREGAR ADELANTE}
procedure agregarAdelante (var l: lista; p: producto);
var
   nue: lista;
begin
     new (nue);
     nue^.dato:= p;
     nue^.sig:= l;
     l:= nue;
end;


{CARGAR LISTA}
procedure cargarLista (var l: lista);
var
   p: producto;
begin
     leerProducto (p);
     while (p.cod <> -1) do
     begin
           agregarAdelante (l, p);
           writeln('--------------------------------------');
           leerProducto (p);
     end;
end;

{Porcentaje de productos con stock actual por debajo de su stock mínimo}

function bajoStock (l: lista): real;
var
   cantidadProductos: integer;
   pocoStock: integer;
begin
     cantidadProductos:= 0;
     pocoStock:= 0;
     while (l <> nil) do
     begin
          cantidadProductos:= cantidadProductos + 1;
          if (l^.dato.stockActual < l^.dato.stockMin) then
             pocoStock:= pocoStock + 1;
          l:= l^.sig;
     end;
     bajoStock:= (pocoStock*100) / cantidadProductos;
end;


{Descripción de aquellos productos con código compuesto por al menos
tres dígitos pares}

function dig3pares (cod: integer): boolean;
var
   contador: integer;
begin
     contador:= 0;
     while (cod <> 0) do
     begin
          if (cod mod 2 = 0) then
             contador:= contador + 1;
          cod:= cod div 10;
     end;
     if (contador >= 3) then dig3pares:= true
                        else dig3pares:= false;
end;


procedure puntoB (l: lista);
begin
     while (l <> nil) do
     begin
          if (dig3Pares(l^.dato.cod)) then
             writeln(l^.dato.descripcion);
          l:= l^.sig;
     end;
end;

{Código de los dos productos más económicos}

procedure puntoC (l: lista; var codMin1: integer; var codMin2: integer);
var
   precioMin1, precioMin2: real;
begin
     codMin1:= 0;
     precioMin1:= 99999999;
     while (l <> nil) do begin
           if (l^.dato.precio < precioMin1) then
           begin
              precioMin2:= precioMin1;
              codMin2:= codMin1;
              precioMin1:= l^.dato.precio;
              codMin1:= l^.dato.cod;
           end
              else if (l^.dato.precio < precioMin2) then
              begin
                   precioMin2:= l^.dato.precio;
                   codMin2:= l^.dato.cod;
              end;
           l:= l^.sig;
     end;
end;


{PROGRAMA PRINCIPAL}
var
   listaProd: lista;
   cantidadProd: integer;
   codMin1, codMin2: integer;

begin
     listaProd:= nil;
     cargarLista (listaProd);
     writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es: ', bajoStock(listaProd):2:2,'%');
     puntoB (listaProd);
     puntoC (listaProd, codMin1, codMin2);
     writeln('Los codigos de los productos mas baratos son: ');
     write(codMin1, ' y ', codMin2);
     readln;
     readln;
end.
