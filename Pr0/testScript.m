for i=1:7
	tic();
	mcint(@sin, 0, pi/2, 10^i);
	resultado(i,1) = toc();
	tic(); 	
	mcintIterTimeTest(@sin, 0, pi/2, 10^i);
	resultado(i,2) = toc();
endfor

resultado
