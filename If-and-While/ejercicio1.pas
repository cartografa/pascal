{1. Realizar un programa que lea 2 números enteros desde teclado e informe
en pantalla cuál de los dos números es el mayor. Si son iguales debe
informar en pantalla lo siguiente: “Los números leídos son iguales”}


program ep2e1;
var
   num1, num2: integer;
begin
   writeln ('Escriba el numero 1: ');
   readln(num1);
   writeln ('Escriba el numero 2: ');
   readln(num2);
   if (num1=num2) then
      writeln ('Los numeros son iguales ');
   readln;
end.
