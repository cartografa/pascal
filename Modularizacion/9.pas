{9. Realizar un programa que lea datos de 100 productos de una tienda de ropa. Para cada producto debe leer el
precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
- El código del producto más barato.
- El código del producto de tipo “pantalón” más caro.}

program ejemplo;

type
    tipos=string[30];

procedure leer (var precio,codigo:integer; var tipo:tipos);
    begin
          writeln('Ingrese tipo de producto');
          readln(tipo);
          writeln('Ingrese codigo del producto');
          readln(codigo);
          writeln('Ingrese precio del producto');
          readln(precio);
    end;

var
    i, precio, codigo, barato, codigobarato, pantalon, caro: integer;
    tipo:tipos;
begin
    barato:= 9999999;
    caro:= -9999999;
    for i:= 1 to 100 do begin
         leer(precio, codigo, tipo);
         if (precio<barato) then
            begin
            barato:= precio;
            codigobarato:= codigo;
            end;
         if (precio>caro) and (tipo='pantalon') then
            begin
            caro:= precio;
            pantalon:=codigo;
         end;
     end;
     writeln('El codigo del producto mas barato es ',codigobarato);
     writeln('El codigo del pantalon mas caro es ',pantalon);
     readln;
end.
