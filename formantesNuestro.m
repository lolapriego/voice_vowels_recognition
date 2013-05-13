% Calcula el punto perteneciente al cluster de puntos
% Calcula formante 1 (eje X) y el formante 2 (eje Y)
% Parámetros: recibe la señal
% Devuelve el punto compuesto por los dos formantes

function [ MATRIZ ] = formantesNuestro( tds )
a = tds(500:1000);
[A E] = lpc(a,12);
[Af w] = freqz(a,1,1000,8000);

A1 = freqz(sqrt(E),A, 1000, 8000);

polos =roots(A); %saco el valor de los polos de A
angulos = angle(polos);
angulosOrdenados = sort(abs(angulos));
angulo1 = angulosOrdenados(3);
angulo2 = angulosOrdenados(5);
F1 = angulo1*8000/2/pi;
F2 = angulo2*8000/2/pi;
MATRIZ = [F1, F2];
end