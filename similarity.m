# Return a matrix length(M1) x length(M2) Jaccard similarity
function sim = similarity(M1, M2)
 sim=zeros(length(M1),length(M2));
 for i=1:length(M1)
  [s,idx] = sort( (M1(i)^2 + M2.^2) ./ (2*M1(i)*M2) );
  sim(i,:) = idx;
  #sim(i,:) = (M1(i)^2*M2.^2) ./ (2*M1(i)*M2)
 endfor
end