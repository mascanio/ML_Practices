function r = coste(tetaVector, m, valoresH, xEntrenamiento, yEntrenamiento)

r = 1 / (2*m) * (xEntrenamiento * tetaVector - yEntrenamiento)' * (xEntrenamiento * tetaVector - yEntrenamiento);

endfunction;
