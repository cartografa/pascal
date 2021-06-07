{7. Dado el siguiente enunciado: “Realice un programa que lea datos de 130 programadores Java de una
empresa. De cada programador se lee el número de legajo y el salario actual. El programa debe imprimir el total
del dinero destinado por mes al pago de salarios, y el salario del empleado mayor legajo”.}

program programadores;

procedure leerDatos (var legajo:integer; var salario:real);
          begin
          writeln('Ingrese el nro de legajo y el salario');
          read(legajo);
          read(salario);
          end;

procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxSalario:real; var maxLegajo:integer);
          begin
               if (nuevoLegajo>maxLegajo) then
               begin
               maxLegajo:= nuevoLegajo;
               maxSalario:= nuevoSalario;
               end;
end;

var
   legajo, maxLegajo, i: integer;
   salario, maxSalario, sumaSalarios: real;
begin
     sumaSalarios:= 0;
     maxLegajo:= -99999999;
     maxSalario:= -99999999;
     for i:= 1 to 4 do begin
         leerDatos(legajo, salario);
         sumaSalarios:= sumaSalarios+salario;
         actualizarMaximo(legajo, salario, maxSalario, maxLegajo);
     end;
     writeln('En todo el mes se gastan $',sumaSalarios:3:3,' pesos.');
     writeln('El salario del empleado mas nuevo es ',maxSalario:3:3);
     readln;
     readln;
end.
