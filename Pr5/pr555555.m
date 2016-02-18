clear;
load ex5data1.mat;

lambda = 1;
maxIters = 1000;
p = 8;
thetaIni = ones(p+1,1);

mEntren = length(X(:,1));

X_gen = genera(X,p);
[X_norm, mu, sigma] = featureNormalize(X_gen);

Xtest_gen = genera(Xtest, p);

Xtest_norm = Xtest_gen;	

Xtest_norm = bsxfun(@minus, Xtest_norm, mu);
Xtest_norm = bsxfun(@rdivide,Xtest_norm, sigma);

opciones = optimset ('Gradobj', 'on', 'MaxIter', maxIters);
funCoste = @(t)coste(t,X_norm,y,lambda);
[thetaProc, cost] = fmincg (funCoste, thetaIni, opciones);

errorPrueba = err(thetaProc, Xtest_norm, ytest)

coste 28657
