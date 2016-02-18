function h = red(Theta1, Theta2, X)

a1 = [1; X];

z2 = Theta1 * a1;
a2 = sigmoide(z2);
a2 = [1; a2];

z3 = Theta2 * a2;
h = sigmoide(z3);

endfunction
