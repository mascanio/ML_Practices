function [X_norm, mu, sigma] = normalizaAtributo(x)
warning("off", "Octave:broadcast");
mu = mean(x);
sigma = std(x);

X_norm = ((x - mu) .* (1 ./ sigma));
warning("on", "Octave:broadcast");
endfunction 
