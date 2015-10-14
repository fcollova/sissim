% G1 = [0.25 0.9 0.99 0.4 0.5 0.87 0.95];
% G2 = [0.3 0.2 0.9 0.84 0.5 0.6 0.95 0.67 0.12];
%G1 = [0.5 0.3 0.2]
%G2 = [0.2 0.4 0.5]


G1= [0.692 0.462 0.000 0.615 0.000 0.077 0.231 0.000 0.000 0.000 0.769 0.538 0.538 0.615];
G2= [0.000 0.000 0.000 0.000 0.000 0.385 0.077 0.000 0.077 0.538 0.077 0.231 0.308 0.231];

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

#Plotting Initializing
hold on


# Initializing
CLout = zeros(m,n);
CLin = zeros(n, m);
SpRplus = zeros(m,n);
SpRmin = zeros(m,n);
CSLout=0;
CSLin=0;

Temp1 = 0.05;
Temp2 = 0.09;

#Temp1 = 0.19; 
#Temp2 = 0.27;

Nave = 10;
Nrun = 500;


[Lout Lin b c]=sissim(Nrun, 3, G1, G2, Temp1, Temp2);

 if length(c) != 0
  # Dati della simulazione 
  # 1:eph
  # 2:nrecpty(old_eventlist)
  # 3:Rplus
  # 4:Rmin
  # 5:RplusT
  # 6:RminT
  # 7:Rqt
  # 8:(Rqt+1)/(Rqt-1)
  # 9:RplusonT
  # 10:RminonT
  # 11:RConT
  
  #plot(c(:,1),c(:,5)) # ,sprintf( '%s', plotColor(i) ), 'LineWidth',2)
  plot(c(:,1),c(:,5))
  plot(c(:,1),c(:,6))
  #plot(c(:,1),c(:,8))

  
  #line ([238 238], [0 20], 'linestyle', '-', 'color', 'r');
  xlabel ("N. of Epoch");
  ylabel (" R+/T R-/T Predicted & Experimental");
  #text (230,-0.3, '238')
  #text (100, 5, 'R = 9')
  #legend ('','238', 'location', 'eastoutside');
 endif

# Compute two Fij
SimG1=similarity(G1,G2);
FijG1=simFij(SimG1);
SimG2=similarity(G2,G1);
FijG2=simFij(SimG2);


# LOut G1->G2 Experimental and Theoric
SpLout = Lout
Th_npG1 = Nrun * Temp1 * G1;
ThG1 = Th_npG1'.*FijG1

# Lin  G2->G1 Experimental and Theoric 
SpLin = Lin
Th_npG2 = Nrun * Temp2 * G2;
ThG2 = Th_npG2'.*FijG2

Qpul1onQmin1 = (Temp1*sum(G1))/(Temp2*sum(G2))


# epoch G12 G21 G-RcTot
filename='EPOCH-EVENT-cumulativi.csv'; 
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d %d %d %d';
sizeA = [5 Inf];
A=fscanf(fid,formatSpec,sizeA )'; 
fclose(fid); %close file
ARplus = A(:,2)+A(:,3);
ARmin  = A(:,2)-A(:,3);
ARplusT = ARplus./A(:,1);
ARminT  = ARmin./A(:,1);
A = [A ARplus ARmin ARplusT ARminT];

plot(A(:,1),A(:,8), '.', 'color', 'r', "markersize", 2 )
plot(A(:,1),A(:,9), '.', 'color', 'g', "markersize", 2 )

%set (gca, 'xtick', 500:500:5000)
%set (gca, 'ytick', 10:10:80)
