{Realizar un programa que analice las inversiones de las empresas
más grandes del país. Para cada empresa se lee su código (un número entero),
la cantidad de inversiones que tiene, y el monto dedicado a cada una de
las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.

El programa deberá informar:
? Para cada empresa, el monto promedio de sus inversiones
? Código de la empresa con mayor monto total invertido
? Cantidad de empresas con inversiones de más de $50000

Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71

Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74

Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)

La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000}

program inversiones;
var
   cod, cant, codMayorMonto, cantMas50000, i: integer;
   monto, montoTotal, promedio, maximo: real;
begin
   codMayorMonto:=0;
   cantMas50000:=0;
   montoTotal:= 0;
   maximo:= 0;
   repeat
         writeln('Ingrese un codigo de empresa: ');
         read(cod);
         writeln('Ingrese la cantidad de inversiones: ');
         read(cant);
         for i:= 1 to cant do
         begin
             writeln('Ingrese monto de inversión: ');
             read(monto);
             montoTotal:= montoTotal + monto;
         end;
         if montoTotal > maximo then begin
            maximo:= montoTotal;
            codMayorMonto:= cod
            end;
         if montoTotal > 50000 then
         begin
            cantMas50000:= cantMas50000 + 1
         end;
         promedio:= montoTotal / cant;
         writeln('Resultado del analisis: Empresa ', cod,' / Monto promedio: ', promedio:2:2);
   until (cod=100);
   writeln('La empresa ', codMayorMonto,' es la que mayor dinero posee invertido (',maximo,').');
   writeln('Hay ',cantMas50000,' empresas con inversiones por mas de $50000');
   readln;
   readln;
end.
