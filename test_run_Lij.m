% G1 = [0.25 0.9 0.99 0.4 0.5 0.87 0.95];
% G2 = [0.3 0.2 0.9 0.84 0.5 0.6 0.95 0.67 0.12];
%G1 = [0.5 0.3 0.2]
%G2 = [0.2 0.4 0.5]


G1= [0.692 0.462 0.000 0.615 0.000 0.077 0.231 0.000 0.000 0.000 0.769 0.538 0.538 0.615]
G2= [0.000 0.000 0.000 0.000 0.000 0.385 0.077 0.000 0.077 0.538 0.077 0.231 0.308 0.231]

m = length(G1);
n = length(G2);

plotColor = 'brgkmcy';
% ‘k’	blacK
% ‘r’	Red
% ‘g’	Green
% ‘b’	Blue
% ‘m’	Magenta
% ‘c’	Cyan
% ‘w’	White
%hold on

cum1 = zeros(m,n);
cum2 = zeros(n, m);
SpRplus = zeros(m,n);
SpRmin = zeros(m,n);

Temp1 = 0.19;
Temp2 = 0.27;
Nrun = 1000;

for i = 1:10
 [a1 a2 b c]=sissim(Nrun, 1, G1, G2, Temp1, Temp2);
% if length(c) != 0
%  plot(c(:,1),c(:,2),sprintf( '%s', plotColor(i) ), 'LineWidth',2)
%  #line ([238 238], [0 20], 'linestyle', '-', 'color', 'r');
%  xlabel ("N. of Epoch");
%  ylabel ("N. of Reciprocal");
%  axis ([0 ,1, 0, 80]) 
%  axis ("auto x")
%  axis("tic[xy]")
%  #text (230,-0.3, '238')
%  text (100, 5, 'R = 9')
%  #legend ('','238', 'location', 'eastoutside');
% endif
 cum1 = cum1 + a1;
 cum2 = cum2 + a2;
 SpRplus = SpRplus +(cum1 + cum2');
 SpRmin = SpRmin + (cum1 - cum2');
 
 
 #SpRapp = SpRplus./SpRmin';
 
endfor

SimG1=similarity(G1,G2);
FijG1=simFij(SimG1);

SimG2=similarity(G2,G1);
FijG2=simFij(SimG2);

# Lij G1 sperimentale e teorica
SpLG1 = cum1/10
Th_npG1 = Nrun * Temp1 * G1;
ThG1 = Th_npG1'.*FijG1

# Lij G2 sperimntale e teorica 
SpLG2 = cum2/10
Th_npG2 = Nrun * Temp2 * G2;
ThG2 = Th_npG2'.*FijG2

# R+ sperimentale e teorica
SpRplus/10
ThRplus = ThG1 + ThG2'

# R- Sperimentale e teorica
SpRmin/10
ThRmin  =  ThG1 - ThG2'

%SpRapp = SpRplus./SpRmin';
%SpRapp/10


%filename='reci1.csv'; 
%fid=fopen(filename,'r'); %open file for read
%formatSpec='%d %d';
%sizeA = [2 Inf];
%A=fscanf(fid,formatSpec,sizeA )' ; 
%fclose(fid); %close file
%plot(A(:,1),A(:,2), '.', 'color', 'k', "markersize", 6 )
%set (gca, 'xtick', 500:500:5000)
%set (gca, 'ytick', 10:10:80)
%
%format long
%test  = (a1.*a2')>0;
%bins  = min(a1.*test,a2'.*test);
%bins = bins ./ sum(sum(bins))
%entropy = nansum(-log2(bins(:)).*bins(:))
% 