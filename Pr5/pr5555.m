clear;
load ex5data1.mat;

lambda = 0;
maxIters = 100;
p = 8;
thetaIni = ones(p+1,1);

mEntren = length(X(:,1));
mPrueba = length(Xval(:,1)); 

X_gen = genera(X,p);
[X_norm, mu, sigma] = featureNormalize(X_gen);

Xval_gen = genera(Xval, p);
	
Xval_norm = Xval_gen;	

Xval_norm = bsxfun(@minus, Xval_norm, mu);
Xval_norm = bsxfun(@rdivide, Xval_norm, sigma);

funCoste = @(p)coste(p,X,y,lambda);
opciones = optimset ('Gradobj', 'on', 'MaxIter', maxIters);


for m = 1:mEntren

	funCoste = @(p)coste(p,X_norm(1:m,:),y(1:m),lambda);
	[thetaProc, cost] = fmincg (funCoste, thetaIni, opciones);

	errorPrueba(m) = err(thetaProc, Xval_norm, yval);
	errorEntren(m) = err(thetaProc, X_norm(1:m,:),y(1:m));

endfor

cla;
hold on;
plot(1:mEntren, errorEntren, 'color', 'blue');
plot(1:mEntren, errorPrueba, 'color', 'green');

title ("Curva de aprendizaje para la regresion polinomial");
ylabel ("Error");
xlabel ("Numero de ejemplos de entrenamiento");

hold off;
