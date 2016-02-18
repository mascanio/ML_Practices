load('dataSave');

for i = 1:12
	for j = 1:75
		x(j) = dataSave(i,j).step;
		porcentaje(j) = dataSave(i,j).porcentaje;
	endfor
	plot(x, porcentaje);	
	if(j == 75 && (mod(i,3) == 1 || i == 12))
		texto = sprintf("Lambda: %.0f", dataSave(i,j).lambda);
		text(x(j) + 1,porcentaje(j), texto);
	endif
	hold on;
endfor
