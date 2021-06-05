{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada
día del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza
cuando se lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada
día, y el monto total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.}

program ejemplo;
const
   corte = 0;
   mes = 31;
var
   venta, monto_dia, monto_mes, i: integer;
begin
   monto_mes:= 0;
   monto_dia:= 0;
   for i:= 1 to mes do
       begin
       repeat
       writeln('Ingrese el monto de las ventas del dia');
       readln(venta);
       monto_dia:= monto_dia+venta;
       until (venta=0);
       writeln('Se realizaron ventas por $',monto_dia,' en este dia');
       monto_mes:= monto_mes+monto_dia;
       end;
   writeln('El total acumulado de ventas del mes es de $',monto_mes);
   readln;
end.
