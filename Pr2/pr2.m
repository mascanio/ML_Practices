s = load("ex2data1.txt");
X = s(:,1:2);
y = s(:,3);
m = length(X(:,1));
X = [ones(m,1), X];

thetaIni = zeros(length(X(1,:)),1);

[J, grad] = coste(thetaIni, X, y);

opciones = optimset ('Gradobj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc (@(t)(coste(t, X, y)), thetaIni, opciones)

plotDecisionBoundary(theta, X, y);

prueba(theta, X, y)
