function s = sigmoide(z)

	zNeg = zeros(length(z(:,1)), length(z(1,:))) .- z;

	s = 1./(1+e.^(zNeg));

endfunction
