function r = teta2(teta, m, valoresH, alpha, xEntrenamientoConUnos, yEntrenamiento)
warning("off", "Octave:broadcast");
a = (valoresH.-yEntrenamiento') .* xEntrenamientoConUnos';
warning("on", "Octave:broadcast");

r = teta - ((alpha/m) * sum(a'))';

endfunction;
