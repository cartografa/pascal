{2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional}

program ej2a;

var
 valor1, valor2, resultado: integer;

begin
 writeln('Ingrese el primer valor');
 readln(valor1);
 writeln('Ingrese el segundo valor');
 readln(valor2);
 resultado:= valor1 + valor2;
 writeln('El resultado es: ', resultado);
 readln;
end.

