load("ex4data1.mat");

num_entradas = 400;
num_ocultas = 25;
num_etiquetas = 10;
itersStep = 2;
numItersMax = 150;
lambda = 1;
m = size(X, 1);
XconUnos = [ones(length (X), 1), X];

ThetaIni1 = pesosAleatorios(num_entradas,num_ocultas);
ThetaIni2 = pesosAleatorios(num_ocultas,num_etiquetas);

thetaIni = [ThetaIni1(:); ThetaIni2(:)];

opciones = optimset ('Gradobj', 'on', 'MaxIter', itersStep);
func = @(p)(costeRN(p, num_entradas, num_ocultas, num_etiquetas, X, y, lambda));

thetaProc = thetaIni;

lambdaPos = 1;
iterPos = 1;


for lambda = sort([1, linspace(0,100,11)]);
	thetaProc = thetaIni;
	func = @(p)(costeRN(p, num_entradas, num_ocultas, num_etiquetas, X, y, lambda));
	iterPos = 1;
	for step = itersStep:itersStep:numItersMax

		[thetaProc, cost] = fmincg (func, thetaProc, opciones);

		ThetaProc1 = reshape(thetaProc(1:num_ocultas * (num_entradas + 1)), ... 
			num_ocultas, (num_entradas + 1));
		ThetaProc2 = reshape(thetaProc((1 + (num_ocultas * (num_entradas + 1))):end), ...
			num_etiquetas, (num_ocultas + 1));

		[a1, a2, z2, resultado] = red(ThetaProc1, ThetaProc2, XconUnos);

		aciertos = 0;
		for i = 1:m
			iterActual = resultado(:,i);
			mx = max(iterActual);
			if(find(iterActual == mx) == y(i)) 
				aciertos++;
			endif
		endfor

		printf("Lmabda: %f Iteraciones: %d Porcentaje de aciertos: %f\n", ... 
			lambda, step, aciertos / m * 100);

		#Preparar para siguiente ietr
		thetaProc = [ThetaProc1(:); ThetaProc2(:)];
		dataSave(lambdaPos, iterPos).lambda = lambda;
		dataSave(lambdaPos, iterPos).step = step;
		dataSave(lambdaPos, iterPos).porcentaje =  aciertos / m * 100;	
		[coste, grad] = func(thetaProc);
		dataSave(lambdaPos, iterPos).coste = coste;

		iterPos++;
	endfor
	lambdaPos++;
endfor
