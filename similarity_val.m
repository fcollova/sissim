# Return a matrix length(M1) x length(M2) Jaccard similarity
function sim = similarity_val(M1, M2)
 sim=zeros(length(M1),length(M2));
 for i=1:length(M1)
  for j=1:length(M2)
#   if (M1(i)!= 0 & M2(j)!= 0 )
    s = nansum((2*M1(i)*M2(j)) / (M1(i)^2 + M2(j)^2));
    sim(i,j) = s;
  endfor
 endfor
end