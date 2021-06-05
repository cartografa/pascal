{3. Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir:
12 4 -10}


program ejercicio3;
var
   num1, num2, num3: integer;
begin
     writeln ('Ingrese el primer numero ');
     readln(num1);
     writeln ('Ingrese el segundo numero ');
     readln(num2);
     writeln ('Ingrese el tercer numero ');
     readln(num3);
     if (num1>num2) then
     begin
        if (num1>num3) then
           begin
           if (num2>num3) then
           begin
               writeln('Los numeros en orden descendente son ', num1,', ', num2,', ', num3,'.')
           end
           else
           begin
               writeln('Los numeros en orden descendente son ', num1,', ', num3,', ', num2,'.')
           end
        else
        begin
            writeln('Los numeros en orden descendente son ', num3,', ', num1,', ', num2,'.')
        end
     else
     begin
         if (num2>num3) then
         begin
            if (num1>num3)
            then
            begin
               writeln('Los numeros en orden descendente son ', num2,', ', num1,', ', num3,'.')
            end
            else
            begin
               writeln('Los numeros en orden descendente son ', num2,', ', num3,', ', num1,'.')
            end
         else
         begin
             writeln('Los numeros en orden descendente son ', num3,', ', num2,', ', num1,'.')
         end
     end;
     writeln('Fin del programa (presione enter)');
     readln;
end.

