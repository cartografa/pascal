{Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program ej4;

type
    rango = 1..100;
    numeros = array [rango] of integer;

{módulos}

function BuscaPos (x: integer; v: numeros): rango;
var
   pos: integer;
   exito: boolean;
begin
     pos:= 1;
     exito:= false;
     while (pos <= 100) and (not exito) do
           if (x = v[pos]) then exito:= true
                           else pos:= pos+1;
     if (exito = false) then pos:= -1;
     BuscaPos:= pos;
end;

{recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y}

procedure intercambio (x: rango; y: rango; var v: numeros);
var
   auxiliar: integer;
begin
     auxiliar:= v[x];
     v[x]:= v[y];
     v[y]:= auxiliar;
end;

{sumaVector: retorna la suma de todos los elementos del vector}

function sumaVector (v: numeros): integer;
var
   i, suma: integer;
begin
     suma:= 0;
     for i:= 1 to 100 do
         suma:= suma + v[i];
     sumaVector:= suma;
end;

{promedio: devuelve el valor promedio de los elementos del vector.}

function promedio (v: numeros): real;
var
   i: rango; suma: integer;
begin
     suma:= 0;
     for i:= 1 to 100 do
         suma:= suma + v[i];
     promedio:= (suma / 100);
end;

{elementoMaximo: retorna la posición del mayor elemento del vector}

function elementoMax (v: numeros): integer;
var
   i: rango; max: integer;
begin
     max:= -1;
     for i:= 1 to 100 do begin
         if (v[i] > max) then
            max:= v[i];
     end;
     elementoMax:= max;
end;

{elementoMinimo: retorna la posicion del menor elemento del vector}

function elementoMin (v: numeros): integer;
var
   i: rango; min: integer;
begin
     min:= 101;
     for i:= 1 to 100 do begin
         if (v[i] < min) then
            min:= v[i];
     end;
     elementoMin:= min;
end;

{proceso de carga con random de 1 al 100}

procedure cargaRandom (var v: numeros);
var
   i: rango;
begin
     for i:= 1 to 100 do
         v[i]:= abs(random(100));
end;

var
   vector: numeros;

begin
     cargaRandom(vector);
     writeln('El numero 50 se encuentra en la posicion: ', BuscaPos(50, vector));
     writeln('El elemento maximo es: ', elementoMax(vector));
     writeln('El elemento minimo es: ', elementoMin(vector));
     writeln('En la posicion 1 se encuentra: ', vector[1]);
     writeln('En la posicion 100 se encuentra: ', vector[100]);
     intercambio (1, 100, vector);
     writeln('Ahora en la posicion 1 se encuentra: ', vector[1]);
     writeln('Ahora en la posicion 100 se encuentra: ', vector[100]);
     writeln('La suma de los elementos del vector da: ', sumaVector(vector));
     writeln('El promedio de los numeros del vector es: ', promedio(vector):2:2);
     readln;
     readln;
end.
