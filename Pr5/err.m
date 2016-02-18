function r = err(theta, X, y)
	warning("off", "Octave:broadcast");

	m = length(X(:,1));

	X = [ones(m, 1), X];
	valoresH = (X * theta);

	a = (valoresH - y) .^ 2;

	r = (1/2/m) * sum(a)

	warning("on", "Octave:broadcast");
endfunction


