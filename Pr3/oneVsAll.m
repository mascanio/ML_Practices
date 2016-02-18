function [all_theta] = oneVsAll(X, y, num_etiquetas, lambda)

	initial_theta = zeros(length(X(1,:)), 1);
	for c = 1:num_etiquetas
		options = optimset("GradObj", "on", "MaxIter", 50);
		all_theta(:,c) = fminunc(@(t)(lrCostFunction(t, X, (y == c), lambda)), initial_theta, options);
	endfor

endfunction
