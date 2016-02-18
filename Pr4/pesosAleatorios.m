function W = pesosAleatorios(L_in, L_out)

W = rand(L_out, L_in + 1) .* 0.24 .- 0.12;

endfunction
