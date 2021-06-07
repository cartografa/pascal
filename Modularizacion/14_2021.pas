{14. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja.
El módulo debe recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra
(1: zona muy fértil, 2: zona estándar, 3: zona árida) y el precio en U$S de la tonelada de
soja; y devolver el rendimiento económico esperado de dicha plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento
por tipo de zona:
Tipo de zona ---> Rendimiento por ha
1 --> 6 toneladas por ha
2 --> 2,6 toneladas por ha
3 --> 1,4 toneladas por ha

b. ARBA desea procesar informacion obtenida de imagenes satelitales de campos sembrados
con soja en la provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de
hectareas sembradas y el tipo de zona (1, 2 o 3). La lectura finaliza al leer un campo
de 900 ha en la localidad eSaladillof, que debe procesarse. El precio de la soja es de
U$S320 por tn. Informar:
+> La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado
   superior a U$S 10.000.
+> La localidad del campo con mayor rendimiento economico esperado.
+> La localidad del campo con menor rendimiento economico esperado.
+> El rendimiento economico promedio. }



program ejercicio14a;

type
    tipoZ= 1..3;
    lugar= string[25];


procedure ingresarCampos (var cantidadHA: real;
                          var zona: tipoZ;
                          var precioSoja: real;
                          var localidad: lugar);
begin
     writeln('Ingrese la localidad');
     read(localidad);
     writeln('Ingrese la cantidad de hectareas sembradas');
     read(cantidadHA);
     writeln('Ingrese el tipo de zona');
     read(zona);
     writeln('Ingrese el precio de la soja por tonelada');
     read(precioSoja);
end;


function rendimiento (cantidadHA: real;
                      zona: tipoZ;
                      precioSoja: real): real;
begin
     case zona of
       1: rendimiento:= (cantidadHA*6*precioSoja);
       2: rendimiento:= (cantidadHA*2.6*precioSoja);
       3: rendimiento:= (cantidadHA*1.4*precioSoja);
     end;
end;


var
   cantidadHA: real;
   zona: tipoZ;
   precioSoja: real;
   localidad: lugar;

begin
     ingresarCampos (CantidadHa, zona, precioSoja, localidad);
     writeln(rendimiento(cantidadHa, zona, precioSoja):2:2);
     readln;
     readln;
end.
