function centroids = randomCentroids(X, K)
	randidx = randperm(size(X,1));
	centroids = X(randidx(1:K),:);
endfunction
