function [J, grad] = coste(theta, X, y, lambda)
	warning("off", "Octave:broadcast");

	m = length(X(:,1));

	X = [ones(m, 1), X];
	valoresH = (X * theta);

	a = (valoresH - y) .^ 2;

	J = (1/2/m) * sum(a) + (lambda/2/m) * sum(theta.^2);

	# Sumandos
	a = (valoresH .- y) .* X;
	# Poner a cero para no incluir el primero	
	theta(1) = 0;

	grad = ((1/m * sum(a)) .+ ((lambda/m) .* theta)')';

	warning("on", "Octave:broadcast");

endfunction
