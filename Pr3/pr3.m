load("ex3data1.mat");
m = size(X, 1);
num_etiquetas = 10;
# Ejemplos aleatorios
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

displayData(sel);

theta = oneVsAll(X, y, num_etiquetas, 1);

display("Porcentaje de aciertos: ");
prueba1(theta, X, y)
