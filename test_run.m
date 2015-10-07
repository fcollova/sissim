% G1 = [0.25 0.9 0.99 0.4 0.5 0.87 0.95];
% G2 = [0.3 0.2 0.9 0.84 0.5 0.6 0.95 0.67 0.12];
% G1 = [.7 .9 .8 0.4]
% G2 = [.3 .7 .2 .6]


G1= [0.692 0.462 0.000 0.615 0.000 0.077 0.231 0.000 0.000 0.000 0.769 0.538 0.538 0.615]
G2= [0.000 0.000 0.000 0.000 0.000 0.385 0.077 0.000 0.077 0.538 0.077 0.231 0.308 0.231]

plotColor = 'brgkmcy';
hold on

for i = 1:7
 [a b c]=sissim(500,G1,G2,0.19,0.27);
 if length(c) != 0
  plot(c(:,1),c(:,2),sprintf( '%s', plotColor(i) ))
  line ([238 238], [0 7], 'linestyle', '-', 'color', 'r');
  xlabel ("N. of Epoch");
  ylabel ("Reciprocity");
  axis ([0 ,1, 0, 7]) 
  axis ("auto x")
  text (230,-0.3, '238')
  text (300, 5, 'N. of run: 7')
  #legend ('','238', 'location', 'eastoutside');
 endif
endfor
