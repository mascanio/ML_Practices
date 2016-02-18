load("ex4data1.mat");
load("ex4weights.mat");

[J,grad] = costeRN([Theta1(:); Theta2(:)], 400, 25, 10, X, y, 1);
J
