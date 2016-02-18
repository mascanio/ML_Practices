function I = mcintIterTimeTest(fun, a, b, num_puntos)
Intervalo = linspace(a,b,abs(b-a)*100);
valores = fun(Intervalo);

maximo = max(valores);

Aleatorios = rand(2, num_puntos);

for i=1:num_puntos
	Aleatorios(1,i) = Aleatorios(1,i) * (b-a) + a;
	Aleatorios(2,i) = Aleatorios(2,i) * maximo;
endfor

porDebajo = 0;
for i = 1:num_puntos
	if(fun(Aleatorios(1,i)) > Aleatorios(2,i))
		porDebajo = porDebajo + 1;
	endif
endfor

I = ((porDebajo / num_puntos)*(b-a)* maximo);

endfunction
