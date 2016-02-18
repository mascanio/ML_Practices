function r = genera(X, p)

r = X;
for i=2:p
  r = [r X.^i];
end

endfunction
