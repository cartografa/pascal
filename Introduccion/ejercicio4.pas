{4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro)
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la
fórmula D*PI (o también PI*R*2)}

program ejercicio4;

const
  pi = 3.1415;

var
  D, R, A, P : real;

begin
     writeln('Ingrese el diametro del circulo: ');
     readln(D);
     R:= D/2;
     writeln('El radio del circulo es: ', R:4:2);
     A:= pi*R*R;
     writeln('El area del circulo es: ', A:4:2);
     P:= D*pi;
     writeln('El perimetro es: ', P:4:2);
     readln;
end.
