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

CLout = zeros(m,n);
CLin = zeros(n, m);

SpRplus = zeros(m,n);
SpRmin = zeros(m,n);
CSLout=0;
CSLin=0;
Temp1 = 0.19;
Temp2 = 0.27;
Nave = 10
Nrun = 500;

for i = 1:Nave
 [Lout Lin b c]=sissim(Nrun, 3, G1, G2, Temp1, Temp2);
 
 
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
 CLout = CLout + Lout;
 CLin  = CLin +  Lin;
 SpRplus = SpRplus + (CLout + CLin');
 SpRmin = SpRmin + (CLout - CLin');
 CSLout = CSLout + sum(sum(Lout));
 CSLin  = CSLin + sum(sum(Lin));
 
 #SpRapp = SpRplus./SpRmin';
 
endfor

SimG1=similarity(G1,G2);
FijG1=simFij(SimG1);

SimG2=similarity(G2,G1);
FijG2=simFij(SimG2);

# LOut G1->G2 Experimental and Theoric
SpLout = CLout/Nave
Th_npG1 = Nrun * Temp1 * G1;
ThG1 = Th_npG1'.*FijG1

# Lin  G2->G1 Experimental and Theoric 
SpLin = CLin/Nave
Th_npG2 = Nrun * Temp2 * G2;
ThG2 = Th_npG2'.*FijG2

# Sum Lout Experimental and Theoric
SpCSLout = CSLout/Nave
ThCSLout = Nrun * Temp1 * sum(G1)

# Sum Lin Experimental and Theoric
SpCSLin = CSLin/Nave
ThCSLout = Nrun * Temp2 * sum(G2)


# R+ Experimental and Theoric
SpRplus = SpCSLout + SpCSLin
ThRplus = (Nrun * Temp1 * sum(G1)) + (Nrun * Temp2 * sum(G2))

# R- Sperimentale e teorica
SpRmin = SpCSLout - SpCSLin
ThRmin = (Nrun * Temp1 * sum(G1)) - (Nrun * Temp2 * sum(G2))

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