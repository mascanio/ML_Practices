function porcentaje = prueba(theta, X, y)
	m = length(X(:,1));

	valoresH = (theta' * X')';
	h = sigmoide(valoresH);

	h = h >= 0.5;

	porcentaje = length(find(h == y)) / m * 100;


endfunction
