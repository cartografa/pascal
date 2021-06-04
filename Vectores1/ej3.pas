{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}


program ej3;

procedure moduloA (v: numeros; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
          writeln(v[i]);
end;

procedure moduloB (v: numero; dimL: integer);
var
   i: integer;
begin
     for i:= dimL downto 1 do
         writeln(v[i]);
end;

procedure moduloC (v: numero; dimL: integer);
var
   i: integer;
   mitad: integer;
begin
   mitad:= dimL DIV 2);
   for i:= mitad downto 1 do
       writeln(v[i]);
   mitad:= mitad+1;
   for i:= mitad to dimL do
       writeln(v[i]);
end;

{INCOMPLETO D Y E}

begin

end.
