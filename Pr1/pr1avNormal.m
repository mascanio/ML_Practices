s = load("ex1data2.txt");

m = length(s(1,:))-1;
tam = length(s(:,1));

X = [ones(tam,1), s(:,1:m)];
Y = s(:,m+1);

tetaVector = pinv(X' * X) * X' * Y

(tetaVector' * [1;1600;3])
