load("ex3data1.mat")
load('ex3weights.mat');

aciertos = 0;

m = size(X, 1);
for i = 1:m
	resultado = red(Theta1, Theta2, X(i, :)');
	mx = max(resultado);
	if(find(resultado == mx) == y(i)) 
		aciertos++;
	endif
endfor
disp("Porcentaje de aciertos:")
aciertos / m * 100
