load ex5data1.mat;

lambda = 0;
iters = 50;

thetaIni = [1;1];

funCoste = @(p)coste(p,X,y,lambda);

opciones = optimset ('Gradobj', 'on', 'MaxIter', iters);
[thetaProc, cost] = fmincg (funCoste, thetaIni, opciones);
cla;
hold on;
plot(X,y, 'x', 'markersize', 12, 'color', 'red');
plot(xRecta , thetaProc(1) .+ thetaProc(2) .* xRecta);

xlabel ("Change in water level (x)");
ylabel ("Water flowing out the dam (y)");

hold off;
