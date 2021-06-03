{5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Si cada caramelo tiene un valor de $1.60, imprima en pantalla el dinero que deberá
cobrar el kiosquero}

program ej5;
const 
    valor_caramelo = 1.60;
var 
    caramelos, clientes, vendidos: integer;
begin
    writeln('Ingrese cantidad de caramelos');
    readln(caramelos);
    writeln('Ingrese cantidad de clientes');
    readln(clientes);
    vendidos:= caramelos div clientes;
    writeln('La cantidad de caramelos que le corresponde a cada cliente es ', vendidos);
    writeln('La cantidad de caramelos que se quedara el kiosquero es ', caramelos mod clientes);
    writeln('El dinero que debe cobrar a cada cliente es $', vendidos*valor_caramelo:2:2);
    readln;
    readln;
end.

