load("ex4data1.mat");

num_entradas = 400;
num_ocultas = 25;
num_etiquetas = 10;
iters = 50;
lambda = 1;

ThetaIni1 = pesosAleatorios(num_entradas,num_ocultas);
ThetaIni2 = pesosAleatorios(num_ocultas,num_etiquetas);

thetaIni = [ThetaIni1(:); ThetaIni2(:)];

opciones = optimset ('Gradobj', 'on', 'MaxIter', iters);
func = @(p)(costeRN(p, num_entradas, num_ocultas, num_etiquetas, X, y, lambda));

[theta, cost] = fmincg (func, thetaIni, opciones);

Theta1 = reshape(theta(1:num_ocultas * (num_entradas + 1)), num_ocultas, (num_entradas + 1));
Theta2 = reshape(theta((1 + (num_ocultas * (num_entradas + 1))):end), num_etiquetas, (num_ocultas + 1));

m = size(X, 1);
X = [ones(length (X), 1), X];
[a1, a2, z2, resultado] = red(Theta1, Theta2, X);

aciertos = 0;
for i = 1:m
	iterActual = resultado(:,i);
	mx = max(iterActual);
	if(find(iterActual == mx) == y(i)) 
		aciertos++;
	endif
endfor

printf("Porcentaje de aciertos: %f\n", aciertos / m * 100);
