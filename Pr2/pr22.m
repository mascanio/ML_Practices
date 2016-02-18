# Leer datos
s = load("ex2data2.txt");
X = s(:,1:2);
y = s(:,3);
m = length(X(:,1));
# Mapear datos de entrenamiento
out = mapFeature(X(:,1),X(:,2));

# Valores de prueba de lambda
lambdaVals = [100, 50, 25, 10, 5, 3, 1, 0.5, 0.05, 0.005];
resultado = [];
for lambda = lambdaVals

	thetaIni = zeros(length(out(1,:)),1);

	[J, grad] = coste2(thetaIni, out, y, lambda)

	opciones = optimset ('Gradobj', 'on', 'MaxIter', 400);
	[theta, cost] = fminunc (@(t)(coste2(t, out, y, lambda)), thetaIni, opciones);
	
	# Rrepresentación gráfica
	plotDecisionBoundary(theta, out, y, lambda);
	print(["pruebaLambda", num2str(lambda), ".png"], "-dpng");

	# Guardar métricas
	porcentaje = prueba(theta, out, y);
	aux.lambda = lambda;
	aux.cost = cost;
	aux.porcentaje = porcentaje;
	resultado = [resultado, aux];
endfor
# Guardar datos en archivo
for i = 1:length(lambdaVals)
	r = resultado(i);
	save resultado -append r;
endfor
