# Return the matrix Fij = {0,1} for M=1 the first similar  
function [Fij] = simFij(sim_mx)
 [m n] = size(sim_mx);
 Fij= zeros(m,n);
 for i=1:m
  Fij(i,sim_mx(i,1)) = 1;
 endfor
end