s = load("ex1data2.txt");

pies = s(:,1);
habitaciones = s(:,2);
precio = s(:,3);

piesN = normalizaAtributo(pies);
habitacionesN = normalizaAtributo(habitaciones);
precioN = normalizaAtributo(precio);

X = [piesN'; habitacionesN'; precioN']

