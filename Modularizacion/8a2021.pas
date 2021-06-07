{8. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa.
   Para cada producto debe leer el precio, codigo y tipo
   (pantalon, remera, camisa, medias, campera, etc.). Informar:
   - Codigo de los dos productos mas baratos.
   - Codigo del producto de tipo pantalon mas caro.
   - Precio promedio. }

program ejercicio8;


type
   cadena15 = string[15];

{módulos}

procedure leerProducto (var precio: real; var codigo: integer;
                        var producto: cadena15);
begin
    write ('Ingrese tipo de producto: ');
    readln (producto);
    write ('Ingrese precio del producto: ');
    readln (precio);
    write ('Ingrese codigo del producto: ');
    readln (codigo);
    writeln ('============================');
end;

procedure masBaratos (precio: real; var masBar1: real; var masBar2: real;
                      cod: integer; var codBar1: integer; var codBar2: integer);
begin
     if (precio < masBar1)
     then begin
          masBar2:= masBar1;
          codBar2:= codBar1;
          masBar1:= precio;
          codBar1:= cod
          end
     else if (precio < masBar2)
          then begin
               masBar2:= precio;
               codBar2:= cod
          end;
end;

procedure pantalonMasCaro (cod: integer ; precio: real; var pPantalon: real;
                          var cPantalon: integer);
begin
     if (precio > pPantalon) then begin
        pPantalon:= precio;
        cPantalon:= cod
        end;
end;

{variables}

var
   precio, suma, masBarato1, masBarato2, precioPantalon: real;
   codigo, codigoPantalonMasCaro, codigoBarato1, codigoBarato2, i: integer;
   producto: cadena15;

{programa principal}

begin
     suma:=0;
     masBarato1:= 9999999999999;
     precioPantalon:= 0;

     for i:= 1 to 6 do begin
         leerProducto (precio, codigo, producto);
         suma:= suma + precio;
         masBaratos (precio, masBarato1, masBarato2, codigo, codigoBarato1,
         codigoBarato2);
         if (producto = 'pantalon') then
            pantalonMasCaro (codigo, precio, precioPantalon, codigoPantalonMasCaro);
         end;

         {informe}
         writeln ('Los codigos de los productos mas baratos son ', codigoBarato1,
         ' y ', codigoBarato2,'.');
         writeln ('El codigo del pantalon mas caro es ', codigoPantalonMasCaro,'.');
         writeln ('El precio promedio es ', suma/6:2:2,' pesos.');
         readln;
         readln;
end.
