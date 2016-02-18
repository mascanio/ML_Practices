load ex5data1.mat;

lambda = 0;
maxIters = 50;
thetaIni = [1;1];

mEntren = length(X(:,1));
mPrueba = length(Xval(:,1)); 

funCoste = @(p)coste(p,X,y,lambda);
opciones = optimset ('Gradobj', 'on', 'MaxIter', maxIters);


for m = 1:mEntren

	funCoste = @(p)coste(p,X(1:m,:),y(1:m),lambda);
	[thetaProc, cost] = fmincg (funCoste, thetaIni, opciones);

	errorPrueba(m) = err(thetaProc, Xval, yval);
	errorEntren(m) = err(thetaProc, X(1:m,:),y(1:m));

endfor

cla;
hold on;
plot(1:mEntren, errorEntren, 'color', 'blue');
plot(1:mEntren, errorPrueba, 'color', 'green');

title ("Curva de aprendizaje para la regresion lienal");
ylabel ("Error");
xlabel ("Numero de ejemplos de entrenamiento");

hold off;


