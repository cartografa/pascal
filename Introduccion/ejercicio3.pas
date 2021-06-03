{3. Implemente un programa que lea dos números reales e imprima el
resultado de la división de los mismos con una precisión de dos decimales.
Por ejemplo, si se ingresan los valores 4,5 y 7,2 , debe imprimir:
El resultado de dividir 4,5 por 7,2 es 0,62}

program ej3;

var
   num1, num2, division : real;

begin
     write('Ingrese el dividendo: ');
     readln(num1);
     write('Ingrese el divisor: ');
     readln(num2);
     division:= num1/num2;
     writeln('El resultado de dividir ', num1:1:1, ' por ', num2:1:1, ' es: ',division:5:2);
     readln;
end.
