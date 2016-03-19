% G1 = [0.25 0.9 0.99 0.4 0.5 0.87 0.95];
% G2 = [0.3 0.2 0.9 0.84 0.5 0.6 0.95 0.67 0.12];
%G1 = [.7 .9 .8 0.4]
%G2 = [.3 .7 .2 .6]


G1= [0.692 0.462 0.000 0.615 0.000 0.077 0.231 0.000 0.000 0.000 0.769 0.538 0.538 0.615]
G2= [0.000 0.000 0.000 0.000 0.000 0.385 0.077 0.000 0.077 0.538 0.077 0.231 0.308 0.231]

plotColor = 'brgkmck';
% ‘k’	blacK
% ‘r’	Red
% ‘g’	Green
% ‘b’	Blue
% ‘m’	Magenta
% ‘c’	Cyan
% ‘w’	White
hold on
#Temp1 = 0.19;
#Temp2 = 0.27;

Temp1 = 0.15;
Temp2 = 0.25;
Nrun = 1000

for i = 1:7
 [a1 a2 b c]=sissim(Nrun, 3, G1, G2, Temp1, Temp2);
 if length(c) != 0
  plot(c(:,1),c(:,2),sprintf( '%s', plotColor(i) ), 'LineWidth',1)
  line ([423 423], [0 20], 'linestyle', '-', 'color', 'r');
  axis ([0 ,1, 0, 16]) 
  axis ("auto x")
  axis("tic[xy]")
  #text (230,-0.3, '238')
  text (300, 10, '(k = 3)')
  #h = legend ('show');
 endif
endfor


filename='reci1.csv'; 
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
A=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file
#plot(A(:,1),A(:,2), '.', 'color', 'k', "markersize", 4 )
plot(A(:,1),A(:,2),':', 'color', 'k', "LineWidth", 4 )

# Plot settings
axis ([0 ,1, 0, 16]) 
axis ("auto x")
axis("tic[xy]")

set (gca, 'xtick', 70:70:1000) #7 epoch = 1 day
set (gca, 'ytick', 1:1:16)
set (gca, 'xticklabel', {'10', '20', '30', '40', '50', '60', '70', '80', '90', '100', '120', '130', '140', '150'})

%xticklabel=['10';'20';'30';'40';'50';'60';'70'];
%set(gca,'xticklabel',xticklabel);


#text (400, 8, 'k = 3')
xlabel ("Days");
ylabel ("N. of Couple Reciprocated");



%format long
%test  = (a1.*a2')>0;
%bins  = min(a1.*test,a2'.*test);
%bins = bins ./ sum(sum(bins))
%entropy = nansum(-log2(bins(:)).*bins(:))
 