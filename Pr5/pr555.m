clear;
load ex5data1.mat;

lambda = 0;
maxIters = 50;
p = 8;
thetaIni = ones(p+1,1);

mEntren = length(X(:,1));
mPrueba = length(Xval(:,1)); 

X_gen = genera(X,p);
[X_norm, mu, sigma] = featureNormalize(X_gen);


funCoste = @(t)coste(t,X_norm,y,lambda);
opciones = optimset ('Gradobj', 'on', 'MaxIter', maxIters);

[thetaProc, cost] = fmincg (funCoste, thetaIni, opciones);
cla;
hold on;
plot(X,y, 'x', 'markersize', 12, 'color', 'red');
plotFit(min(X),max(X), mu, sigma, thetaProc, p);

xlabel ("Cambio en el nivel del agua (x)");
ylabel ("Agua que derrama la presa (y)");
title ("Regresion polinomica (lambda = 0)");
