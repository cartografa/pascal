{2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
b. Sin utilizar una variable adicional}

program ej2b;

var
   valor1, valor2 : integer;

begin
     writeln('Ingrese el primer valor');
     readln(valor1);
     writeln('Ingrese el segundo valor');
     readln(valor2);
     writeln('El resultado es: ', valor1+valor2);
     readln;
end.

