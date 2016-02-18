# LECTURA DE DATOS
s = load("ex1data1.txt");
xEntrenamiento = s(:,1);
yEntrenamiento = s(:,2);
m = length(xEntrenamiento);
# Poner una fila de unos en las x
xEntrenamientoConUnos = [ones(length(xEntrenamiento),1), xEntrenamiento];

tetaVector = [0;0];

cost = inf;
costeAnterior = 0;
i = 1;
vectorCoste = [];
while(abs(cost - costeAnterior) > 0.00003)

	valoresH = (tetaVector' * xEntrenamientoConUnos');
	tetaVector = teta2(tetaVector, m, valoresH, 0.01, xEntrenamientoConUnos, yEntrenamiento);

	costeAnterior = cost;
	cost = coste(tetaVector, m, valoresH, xEntrenamientoConUnos, yEntrenamiento);

	vectorCoste = [vectorCoste, cost];
	i++;
endwhile

# Representacion
x = [min(xEntrenamiento):0.1:max(xEntrenamiento)];
xConUnos = [ones(1, length(x)); x];
y = (tetaVector' * xConUnos);

plot(xEntrenamiento, yEntrenamiento, 'ro','markersize',5);
hold on;
plot(x,y);
hold off;

