{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}


program ejercicio4;

const
     minuto = 3.40;
     MB = 1.35;

type
    linea = record
            telefono: integer;
            cantMin: integer;
            cantMB: integer;
            end;
    cliente = record
              codigo: integer;
              cantLineas: integer;
              end;

procedure leerLinea (var l: linea);
begin
     writeln('Ingrese numero telefonico:');
     readln(l.telefono);
     writeln('Ingrese cantidad de minutos consumidos:');
     readln(l.cantMin);
     writeln('Ingrese cantidad de MB consumidos:');
     readln(l.cantMB);
end;

procedure leerCliente (var cl: cliente;
                       var l: linea;
                       var fMin: real;
                       var fMB: real);
var
   i: integer;
begin
     fMin:= 0;
     fMB:= 0;
     writeln('Ingrese codigo de cliente');
     readln(cl.codigo);
     writeln('Ingrese cantidad de lineas');
     readln(cl.cantLineas);
     for i:= 1 to cl.cantLineas do begin
         leerLinea(l);
         fMin:= fMin + (l.cantMin * minuto);
         fMB:= fMB + (l.cantMB * MB);
     end;
end;

var
   ln: linea;
   cl: cliente;
   fMin: real;
   fMB: real;
   i: integer;

begin
     for i:= 1 to 2 do begin
         leerCliente (cl, ln, fmin, fMB);
         writeln('================================');
         writeln('Facturacion de minutos: $', fmin:2:2);
         writeln('Facturacion de MB: $', fMB:2:2);
         writeln('================================')
     end;
     readln;
end.
