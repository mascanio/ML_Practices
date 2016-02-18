function [a1,a2,z2,a3] = redSimple(Theta1, Theta2, X)

a1 = X;

z2 = a1 * Theta1';
a2 = sigmoide(z2);
a2 = [1, a2];

z3 = a2 * Theta2';
a3 = sigmoide(z3);

endfunction
