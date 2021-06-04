{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo
(a lo sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse)
o cuando se completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello,
implementar un módulo que reciba como parámetro un valor real X, el vector de valores
reales y su dimensión lógica y retorne el mismo vector en el cual cada elemento fue
multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}


program ej10;

const
     dimF = 300;

type
    cadena20 = string[20];
    empleados = record
             nombre: cadena20;
             apellido: cadena20;
             salario: real;
             end;
    vectorEmpleados = array [1..dimF] of empleados;

procedure leerEmpleado (var e: empleados);
begin
     writeln('Ingrese salario');
     readln(e.salario);
     if (e.salario <> 0) then begin
           writeln('Ingrese nombre');
           readln(e.nombre);
           writeln('Ingrese apellido');
           readln(e.apellido);
     end;
end;

procedure cargarEmpleado (var v: vectorEmpleados; dimL: integer);
var
   e: empleados;
begin
   leerEmpleado(e);
   dimL:= 0;
   while (e.salario <> 0) and (dimL < dimF) do
   begin
        dimL:= dimL + 1;
        v[dimL]:= e;
        leerEmpleado(e);
   end;
end;

{a) modulo de incremento del 15% del salario}

procedure incremento (var v: vectorEmpleados; dimL: integer;
                     cant: real);
var
   i: integer;
begin
     for i:= 1 to dimL do
         v[i].salario:= v[i].salario + (v[i].salario * cant / 100)
end;

{b) modulo que muestre en pantalla sueldo promedio}

function promedioSueldos (v: vectorEmpleados; dimL: integer): real;
var
   suma: real;
   i: integer;
begin
     suma:= 0;
     for i:= 1 to dimL do
         suma:= suma + v[i].salario;
     promedioSueldos:= suma/ dimL;
end;

{PROGRAMA PRINCIPAL}

var
   vector: vectorEmpleados;
   dimL: integer;
   aumento: real;

begin
     cargarEmpleado(vector, dimL);
     aumento:= 15;
     incremento(vector, dimL, aumento);
     writeln('El promedio de sueldos es de: ');
     writeln(promedioSueldos(vector, dimL):2:2);
     readln;
     readln;
end.
