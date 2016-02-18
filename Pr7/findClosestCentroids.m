function idx = findClosestCentroids(X, centroids)
	m = size(X)(1);
	k = size(centroids)(1);

	for i=1 : m % Por cada ejemplo de entrenamiento
		min = inf; 
		posMin = 0;
		for j=1 : k
			suma = sum((X(i,:) .- centroids(j,:)) .^ 2);
			if (suma < min)
				min = suma; 
				posMin = j;
			endif
		endfor 
		idx(i) = posMin;
	endfor

endfunction
