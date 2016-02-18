function [X_norm, mu, sigma] = normalizaAtributo(x)

mu = mean(x);    
sigma = std(x);

X_norm = ((x .- mu) * (1/ sigma));

endfunction 
