function [J, grad] = coste(theta, X, Y)
	warning("off", "Octave:broadcast");
	m = length(X(:,1));

	valoresH = (theta' * X')';
	h = sigmoide(valoresH);

	a = (0.-Y) .* log(h) .- ((1 .- Y) .* log(1 .- h));

	J = (1/m) * sum(a);
	a = (h .- Y) .* X;

	grad = 1/m * sum(a);
	warning("on", "Octave:broadcast");

endfunction
