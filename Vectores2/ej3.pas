{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a
sus clientes. Para ello, cuenta con información sobre todos los viajes realizados
durante el mes de marzo. De cada viaje se cuenta con la siguiente información: día
del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por el camión
(medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo
200). La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km,
que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó
menos dinero.
- La cantidad de viajes realizados cada día del mes.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes
cuya distancia recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez. }

program ej3;

const
     dimF = 200;

type
    rango = 1..31;
    viaje = record
           dia: rango;
           monto: real;
           distancia: real;
           end;
    vectorViajes = array [1..dimF] of viaje;
    vectorContador = array [rango] of integer;

{-----------------CARGAR VECTOR---------------------}

{LEER VIAJE}
procedure cargarViaje (var v: viaje);
begin
     writeln('Ingrese distancia del viaje');
     readln(v.distancia);
     if (v.distancia <> 0) then begin
        writeln('Ingrese dia del viaje');
        readln(v.dia);
        writeln('Ingrese monto transportado');
        readln(v.monto);
     end;
end;

{CARGAR TODO EL VECTOR}
procedure cargarVector (var v: vectorViajes; var dimL: integer);
var
   entrada: viaje;
begin
     dimL:= 0;
     cargarViaje(entrada);
     while (entrada.distancia <> 0) and (dimL < dimF) do
     begin
          dimL:= dimL+1;
          v[dimL]:= entrada;
          cargarViaje(entrada);
     end;
end;

{-----------------------------------------------------------}
{b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje
que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.}
{--------------------------------------------------------------------}

procedure inicializarContador (var c: vectorContador);
var
   i: integer;
begin
     for i:= 1 to 31 do begin
         c[i]:= 0;
     end;
end;

procedure mostrarViajesxDia (c: vectorContador);
var
   i: rango;
begin
     for i:= 1 to 31 do
         writeln('El dia ', i,' se hicieron ', c[i], 'viaje(s).');
end;


procedure calculos (v: vectorViajes; dimL: integer;
                   var sumaM: real; var diaM: rango;
                   var menorM: real; var distM: real;
                   var c: vectorContador);
var
   i: integer;
begin
     menorM:= 999999999999999;
     sumaM:= 0;
     for i:= 1 to dimL do begin
         sumaM:= sumaM + v[i].monto;
         if (v[i].monto < menorM) then begin
            menorM:= v[i].monto;
            distM:= v[i].distancia;
            diaM:= v[i].dia;
         end;
     c[v[i].dia]:= c[v[i].dia] + 1;
     end;
     writeln('La distancia del viaje con el menor monto fue ', distM);
     writeln('El dia del viaje con el menor monto fue ', diaM);
     writeln('El monto promedio transportado fue ', sumaM/dimL:2:2);
     mostrarViajesxDia(c);
end;

{-----------------------------------------------------------------------}
{c) Realizar un módulo que reciba el vector generado en a) y elimine todos
los viajes cuya distancia recorrida sea igual a 100 km.}
{----------------------------------------------------------------------}

procedure borrarPos (var v: vectorViajes; var dimL: integer;
                     pos: integer);
var
   i: integer;
begin
   for i:= pos + 1 to dimL do
       v[i-1]:= v[i];
   dimL:= dimL - 1;
end;


procedure borrarMenor100km (var v: vectorViajes; var dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do begin
         if (v[i].distancia < 100) then
             borrarPos(v, dimL, i);
     end;
end;

{procedure PuntoH (var v: vectorClientes; var dimL: integer); 
Elimine todos los clientes que realizan la actividad Spinning.
var pos: integer;
begin
  pos:= 1;
  while (pos <= dimL) do
  begin
     if (v[pos].act = 2) then BorrarPosModif (v, dimL, pos);
                         else pos:= pos + 1;
  end;
end;  }






{------------------------------------------------------------------}
{                       PROGRAMA PRINCIPAL                         }
{------------------------------------------------------------------}

var
   dimL: integer;
   viajes: vectorViajes;
   contador: vectorContador;
   sumaMontos: real;
   menorMonto: real;
   diaMenor: rango;
   distanciaMenor: real;

begin
     inicializarContador(contador);
     cargarVector (viajes, dimL);
     calculos (viajes, dimL, sumaMontos, diaMenor, menorMonto, distanciaMenor, contador);
     readln;
     readln;

end.
