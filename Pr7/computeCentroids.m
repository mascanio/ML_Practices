function centroids = computeCentroids(X, idx, K)
	for k = 1:K
		C = X(find(idx == k), :);
		centroids(k,:) = mean(C);
	endfor
endfunction
