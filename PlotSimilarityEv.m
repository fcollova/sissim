set (0, "defaultaxesfontname", "Helvetica") 
set (0, "defaultaxesfontsize", 16) 
set (0, "defaulttextfontname", "Helvetica") 
set (0, "defaulttextfontsize", 16) 

#-------------------21------------------
filename='eventi_G12.csv';
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
B=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file


G1= [0.692 0.462 0.000 0.615 0.000 0.077 0.231 0.000 0.000 0.000 0.769 0.538 0.538 0.615];
G2= [0.000 0.000 0.000 0.000 0.000 0.385 0.077 0.000 0.077 0.538 0.077 0.231 0.308 0.231];

m=length(G1);
n=length(G2);
 
Sim12 = similarity_val(G1,G2);
#SimV = Sim(B(:,1) B(:,2))

Simv=[];

for i=1:length(B)
 Simv=[ Simv Sim12(B(i,1), B(i,2)-14) ];
endfor


B12 =[B Simv'];
hold on
plot(B12(:,3), '.', 'color', 'r', "markersize", 6 )

#-------------------21------------------

filename='eventi_G21.csv'; 
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
B=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file

Sim21 = similarity_val(G2,G1);
#SimV = Sim(B(:,1) B(:,2))

Simv=[];

for i=1:length(B)
 Simv=[ Simv Sim21(B(i,1)-14, B(i,2) ) ];
endfor

B21 =[B Simv'];

plot(B21(:,3), '.', 'color', 'b', "markersize", 6 )
xlabel ("Sequence of Events",'FontSize', 16);
ylabel ("Similarity",'FontSize', 16);
  
hold off
input ("Pick a number, any number! ")


hold on
PP = [B12(:,3)' B21(:,3)'];
hist(PP ,20)
xlabel ("Similarity Value",'FontSize', 16);
ylabel ("Freq. of Intergroup Events",'FontSize', 16);

hold off

input ("Pick a number, any number! ")
hold on

Val12=reshape(Sim12,1,m*n);
#Val21=reshape(Sim21,1,m*n);
Val12=Val12(Val12!=0);
#Val21=Val21(Val21!=0);
hist(Val12',20)
#hist(Val21,20)
xlabel ("Similarity Value",'FontSize', 16);
ylabel ("Feq. of Similarity value",'FontSize', 16);