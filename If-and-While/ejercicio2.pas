{2. Realizar un programa que lea un número real e imprima su valor absoluto.
El valor absoluto de un número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program ejercicio2;
var
   numero, absoluto: real;
begin
   writeln( 'Ingrese numero: ');
   readln(numero);
   if (numero>=0) then
      absoluto:= numero ;
   else
      absoluto:= numero * (-1);
   writeln ('El valor absoluto de ', numero, 'es: ', absoluto);
end.
