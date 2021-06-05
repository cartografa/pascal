{Realizar un programa que lea información de autos que están a la venta
en una concesionaria. De cada auto se lee: marca, modelo y precio. La
lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse.
La información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro}

program ejercicio5;

type
    cadena15 = string[15];
    cadena25 = string[25];
    a = record
        marca: cadena15;
        modelo: cadena25;
        precio: real;
        end;

procedure leerAuto (var auto: a);
begin
     writeln('Ingrese marca de automovil');
     readln(auto.marca);
     if (auto.marca <> 'ZZZ') then
     begin
        writeln('Ingrese modelo');
        readln(auto.modelo);
        writeln('Ingrese precio');
        readln(auto.precio);
     end;
end;

procedure maximo (auto: a;
                  marcaAc: cadena15;
                  var pr: real;
                  var mar: cadena15;
                  var model: cadena25);
begin
     if (pr > auto.precio) then begin
        pr:= auto.precio;
        mar:= marcaAc;
        model:= auto.modelo
     end;
end;


var
   auto: a;
   marcaActual: cadena15;
   suma: real;
   cantidad: integer;
   marcaC: cadena15;
   modeloC: cadena25;
   precioC: real;

begin
     precioC:= 0;
     leerAuto(auto);
     while (auto.marca <> 'ZZZ') do begin
         marcaActual:= auto.marca;
         suma:= 0;
         cantidad:= 0;
         while (marcaActual = auto.marca) and (auto.marca <> 'ZZZ') do
         begin
              cantidad:= cantidad + 1;
              suma:= suma + auto.precio;
              maximo (auto, marcaActual, precioC, marcaC, modeloC);
              leerAuto(auto);
         end;
         writeln('=============================');
         writeln('El precio promedio de la marca ', marcaActual,' es de ',suma/cantidad:2:2);
         writeln('=============================');
     end;
     writeln('============================');
     writeln('El auto mas caro es marca ', marcaC,', modelo ', modeloC);
     writeln('=============================');
     readln;
end.
