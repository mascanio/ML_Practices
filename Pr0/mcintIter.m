# I = mcint(fun, a, b, num_puntos)
# I = Integral de fun entre los puntos a y b por el metodo Monte Carlo, 
# con num_puntos para su calculo

function I = mcintIter(fun, a, b, num_puntos)
# Calculo del maximo de la funcion
# El numero de x generadas depende de lo grande
# que sea el intervalo pasado como parámetro.
# Se calculan 100 x por unidad
numX = abs(b-a)*100;
x = linspace(a,b,numX);
y = fun(x);
maximo = 0;
for i= 1:numX 
	if(fun(y(i)) > maximo)
		maximo = fun(y(i));
	endif
endfor

#Generar los puntos aleatorios, escalarlos y desplazarlos
AleatoriosX = rand(num_puntos);
AleatoriosY = rand(num_puntos);
for i=1:num_puntos
	AleatoriosX(i) = AleatoriosX(i) * (b-a) + a;
	AleatoriosY(i) = AleatoriosY(i) * maximo;
endfor

#Calcular cuantos puntos quedan por debajo de la función
porDebajo = 0;
for i = 1:num_puntos
	if(fun(AleatoriosX(i)) > AleatoriosY(i))
		porDebajo = porDebajo + 1;
	endif
endfor

I = ((porDebajo / num_puntos)*(b-a)* maximo);

endfunction
