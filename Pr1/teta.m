function r = teta(tetaIni, m, valoresH, alpha, xEntrenamiento, yEntrenamiento, j)

if (j == 0)
r = tetaIni - (alpha / m) * sum((valoresH - yEntrenamiento));
else
r = tetaIni - (alpha / m) * sum((valoresH - yEntrenamiento) .* xEntrenamiento);
endif

endfunction
