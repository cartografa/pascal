{Una empresa importadora de microprocesadores desea implementar un sistema de software
para analizar la información de los productos que mantiene actualmente en stock. Para ello,
se conoce la siguiente información de los microprocesadores: marca (Intel, AMD, NVidia, etc),
línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.), cantidad de cores o núcleos de procesamiento
(1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en nanómetros (nm) de los transistores
(14, 22, 32, 45, etc.). La información de los microprocesadores se lee de forma consecutiva por
marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no debe
procesarse). Se pide implementar un programa que lea información de los microprocesadores de la
empresa importadora e informe:
? Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
? Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
? Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
velocidades de al menos 2 Ghz.}


program ejercicio6;

type
    cadena15 = string[15];
    m = record
        marca: cadena15;
        linea: cadena15;
        nucleo: integer;
        velocidad: real;
        tamanio: integer;
        end;

procedure leerM (var mi: m);
begin
     writeln('Ingrese cantidad de nucleos: ');
     readln(mi.nucleo);
     while (mi.nucleo <> 0) do begin
           writeln('Ingrese marca: ');
           readln(mi.marca);
           writeln('Ingrese linea: ');
           readln(mi.linea);
           writeln('Ingrese velocidad del reloj: ');
           readln(mi.velocidad);
           writeln('Ingrese tamaño de transistores: ');
           readln(mi.tamanio);

     end;
end;

{cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
velocidades de al menos 2 Ghz.}
function multiIntelAMD (micro: m):boolean;
begin
     multiIntelAMD:= (micro.nucleo > 1) and (micro.velocidad >= 2);
end;

{para anunciar marca y linea de quienes cumplan esto luego de cada ingreso}
function nucleoTransistor (micro: m):boolean;
begin
     nucleoTransistor:= (micro.nucleo > 2) and (micro.tamanio < 22);
end;

{las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.}
procedure actualizarMax (contador: integer; mActual: cadena15;
                         var marcaMax1: cadena15;
                         var marcaMax2: cadena15;
                         var cantMax1: integer;
                         var cantMax2: integer);
begin
     if (contador > cantMax1) then begin
        cantMax2:= cantMax1;
        marcaMax2:= marcaMax1;
        cantMax1:= contador;
        marcaMax1:= mActual;
     end
     else if (contador > cantMax2) then begin
          cantMax2:= contador;
          marcaMax2:= mActual;
     end;
end;



var
   microprocesador: m;
   marcaActual: cadena15;
   marcaMax1: cadena15;
   marcaMax2: cadena15;
   cantMax1: integer;
   cantMax2: integer;
   contadorMulticore: integer;
   contadorTransistor: integer;


begin
     contadorMulticore:= 0;
     marcaMax1:= ' ';
     cantMax1:= -1;
     leerM (microprocesador);
     while (microprocesador.nucleo <> 0) do
     begin
          marcaActual:= microprocesador.marca;
          contadorTransistor:= 0;
          while (microprocesador.marca = marcaActual) do
          begin
               if ((marcaActual = 'AMD') or (marcaActual = 'Intel')) then
                  if (multiIntelAMD(microprocesador)) then
                     contadorMulticore:= contadorMulticore+1;
               if (microprocesador.tamanio = 14) then
                  contadorTransistor:= contadorTransistor+1;
               if (nucleoTransistor(microprocesador)) then
                  writeln('El modelo ', microprocesador.linea,' de la marca ', marcaActual,' tiene un procesador de mas de 2 cores con transistores de a lo sumo 22 nm.');
               leerM (microprocesador);
          end;
          actualizarMax (contadorTransistor, marcaActual, marcaMax1, marcaMax2, cantMax1, cantMax2);
          end;
      writeln('Cantidad multicore de Intel o AMD con reloj de al menos 2 Ghz: ',contadorMulticore);
      writeln('Las marcas con más micro con transistores de 14 nm son:');
      writeln('Marca ', marcaMax1,' y ', marcaMax2,'.');
end.
