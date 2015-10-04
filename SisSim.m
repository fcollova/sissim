
# Data Value of Netwoks G1 & G2 are Centrality vector of i-th node
G1 = [0.25 0.9 1.3 0.4 0.5 2.6 1.7];
G2 = [0.3 0.2 0.9 0.84 0.5 0.6 0.95 0.67 0.12];

# Compute uniform distribution and regularize
UnG1 = unifcdf(G1',min(G1),max(G1));
UnG2 = unifcdf(G2',min(G2),max(G2));
UnG1(UnG1(:,1)==0,1) = 1/(length(UnG1)^2);
UnG2(UnG2(:,1)==0,1) = 1/(length(UnG2)^2);
UnG1 = UnG1';
UnG2 = UnG2';

# Main Simulation
#Inizializzazioni ---------
# Matrice somma eventi intragruppo
old_mx = zeros(length(G1),length(G2));
old_eventlist = [];
Temp1=0.10;
Temp2=0.15;
Sim12 = similarity(UnG1, UnG2)
Sim21 = similarity(UnG2, UnG1)

#--------------------------


# Simulation Run
for eph = 1:100
 [next_mx, next_eventlist] = sis_step( eph, old_mx, old_eventlist,G1, G2, UnG1, UnG2, Sim12, Sim21, Temp1, Temp2);
 old_mx=next_mx;
 old_eventlist=next_eventlist;
endfor

old_mx
old_eventlist