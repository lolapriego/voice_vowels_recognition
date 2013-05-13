% Limpiamos la memoria para cargar la señal incógnita
clear

% Cargamos las tres muestras correspondientes a cada vocal
% Llamamos a la función formantes para obterner su par de formantes
% Construimos la matriz vocalX con tres pares de formantes de cada vocal

load a1;
load a2;
load a3;
A1 = formantesNuestro(a1);
A2 = formantesNuestro(a2);
A3 = formantesNuestro(a3);
vocalA = [A1; A2; A3];

load e1;
load e2;
load e3;
E1 = formantesNuestro(e1);
E2 = formantesNuestro(e2);
E3 = formantesNuestro(e3);
vocalE = [E1; E2; E3];


load i1;
load i2;
load i3;
I1 = formantesNuestro(i1);
I2 = formantesNuestro(i2);
I3 = formantesNuestro(i3);
vocalI = [I1; I2; I3];


load o1;
load o2;
load o3;
O1 = formantesNuestro(o1);
O2 = formantesNuestro(o2);
O3 = formantesNuestro(o3);
vocalO = [O1; O2; O3];


load u1;
load u2;
load u3;
U1 = formantesNuestro(u1);
U2 = formantesNuestro(u2);
U3 = formantesNuestro(u3);
vocalU = [U1; U2; U3];

% Cargamos la señal incógnita y calculamos sus formantes

load example1;
Formantes = formantesNuestro(i1);

% Calculamos la nube que formará el cluster de puntos de las señales que conforman la base de datos

Nube = [vocalA; vocalE; vocalI; vocalO; vocalU];

% Dibujamos la nube y obtenemos los centroides

scatter(Nube(:,1),Nube(:,2));
axis([50 1500 200 2200])
[Ind C]=kmeans(Nube,5,'replicates',10);
hold on
scatter(C(:,1),C(:,2),150);
hold off

% Calculamos la distancia mínima de la señal incógnita a los centroides para determinar la vocal

distanciamin = sqrt((Formantes(1)-C(1,1))^2+(Formantes(2)-C(1,2))^2);
vocal = 'U';
VOCALES = ['U' 'I' 'O' 'A' 'E'];
for i=2:5
    if(distanciamin<sqrt((Formantes(1)-C(i,1))^2+(Formantes(2)-C(i,2))^2))
        distanciamin = sqrt((Formantes(1)-C(i,1))^2+(Formantes(2)-C(i,2))^2);
        vocal = VOCALES(i);
    end
end
display(vocal);