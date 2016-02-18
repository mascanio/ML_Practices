# I = mcint(fun, a, b, num_puntos)
# I = Integral de fun entre los puntos a y b por el metodo Monte Carlo, 
# con num_puntos para su calculo
#
# a y b pueden ser vectores de la misma longitud, de tal forma que
# I[n] = mcint(fun, a[n], b[n], num_puntos)

function I = mcint(fun, a, b, num_puntos)

if length (a) != length (b)
	error("Las dimensiones de a y b no coinciden");
endif

# Calculo del maximo de la funcion
# El numero de x generadas depende de lo grande
# que sea el intervalo más amplio pasado como parámetro.
# Se calculan 100 x por unidad
numX = max(abs(b-a)) * 100;
x = linspace(a,b,numX); 
y = fun(x); #Generar los valores de fun para cada valor de x
maximo = max(max(y));

#Generar los puntos aleatorios, escalarlos y desplazarlos
AleatoriosX = rand(length(a), num_puntos);
AleatoriosY = rand(length(b), num_puntos);

#Calcular traspuestas
ta = a(:);
tb = b(:);

#Calcular los puntos aleatorios
warning("off", "Octave:broadcast"); #Se realiza correctamente, se puede ignorar el warning
AleatoriosX = (AleatoriosX .* (tb-ta) + ta);
AleatoriosY = AleatoriosY .* maximo;
warning ("error", "Octave:broadcast");

#Calcular cuantos puntos quedan por debajo de la función
for i=1:length(a) 
	porDebajo(i) =  length(find((fun(AleatoriosX(i,:)) > AleatoriosY(i,:))));
endfor
#porDebajo = length(find((fun(AleatoriosX) > AleatoriosY)));

I = ((porDebajo .* (1/num_puntos)).*(b-a) * maximo);
#I = ((porDebajo / num_puntos)*(b-a)* maximo);

endfunction
