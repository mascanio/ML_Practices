s = load("ex1data2.txt");

valoresAlpha = [0.3,0.1,0.03,0.01,0.003,0.001,0.0003,0.0001];

for alpha = valoresAlpha

m = length(s(1,:))-1;
tam = length(s(:,1));

X = s(:,1:m);
[X, mu,sigma] = normalizaAtributo(X);
X = [ones(tam,1), X];
Y = s(:,m+1);

tetaVector = zeros(m+1,1);

cost = inf;
costeAnterior = 0;

while(abs(cost - costeAnterior) > 0.0003)

	valoresH = (tetaVector' * X');

	tetaVector = teta2(tetaVector, m, valoresH, alpha, X, Y);

	costeAnterior = cost;
	cost = coste(tetaVector, m, valoresH, X, Y);

endwhile

display("---------------");
alpha
tetaVector
(tetaVector' * [1;(1600 - mu(1))/sigma(1);(3-mu(2))/sigma(2)])
display("---------------");

endfor


