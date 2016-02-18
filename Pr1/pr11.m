#leer de fichero
s = load("ex1data1.txt");

xEntrenamiento = s(:,1);
xEntrenamiento = xEntrenamiento';
yEntrenamiento = s(:,2);
yEntrenamiento = yEntrenamiento';

plot(xEntrenamiento, yEntrenamiento, 'ro','markersize',5);
hold;

m = length(xEntrenamiento);

tetaVector = [0,0];
for i = [1:1500] 
	valoresH = (tetaVector(1) + tetaVector(2) * xEntrenamiento);
	tetaVector(1) = teta(tetaVector(1), m, valoresH, 0.01, xEntrenamiento, yEntrenamiento, 0);
	tetaVector(2) = teta(tetaVector(2), m, valoresH, 0.01, xEntrenamiento, yEntrenamiento, 1);

endfor

tetaVector

x = [5:0.1:max(xEntrenamiento)];
y = tetaVector(1) + tetaVector(2) * x;

plot(x,y);
