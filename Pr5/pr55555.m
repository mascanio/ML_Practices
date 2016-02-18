clear;
load ex5data1.mat;

lambda = 0;
maxIters = 1000;
p = 8;
thetaIni = ones(p+1,1);

mEntren = length(X(:,1));

X_gen = genera(X,p);
[X_norm, mu, sigma] = featureNormalize(X_gen);

Xval_gen = genera(Xval, p);

Xval_norm = Xval_gen;	

Xval_norm = bsxfun(@minus, Xval_norm, mu);
Xval_norm = bsxfun(@rdivide, Xval_norm, sigma);

opciones = optimset ('Gradobj', 'on', 'MaxIter', maxIters);
lambda = [0, 0.001, 0.003, 0.01, 0.03, 0.1, 0.3, 1, 3, 10];
for i = 1:length(lambda)

	funCoste = @(t)coste(t,X_norm,y,lambda(i));
	[thetaProc, cost] = fmincg (funCoste, thetaIni, opciones);

	errorPrueba(i) = err(thetaProc, Xval_norm, yval);
	errorEntren(i) = err(thetaProc, X_norm,y);

endfor

cla;
hold on;
size(lambda)
size(errorEntren)
plot(lambda, errorEntren, 'color', 'blue');
plot(lambda, errorPrueba, 'color', 'green');

title ("Curva de aprendizaje para la regresion lienal");
ylabel ("Error");
xlabel ("Lambda");

hold off;
