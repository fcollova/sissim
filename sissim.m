# Data Value of Netwoks G1 & G2 are Centrality vector of i-th node

function [mx eventlist] = sissim(Neph, G1,G2, Temp1, Temp2)

 # Compute uniform distribution and regularize
 UnG1 = unifcdf(G1',min(G1),max(G1));
 UnG2 = unifcdf(G2',min(G2),max(G2));
 UnG1(UnG1(:,1)==0,1) = 1/(length(UnG1));
 UnG2(UnG2(:,1)==0,1) = 1/(length(UnG2));
 UnG1 = UnG1';
 UnG2 = UnG2';

 # Inizializzation ---------
 # Matrix of total intergroup events  (G1->G2 + G2->G1) rettangular G1 x G2
 old_mx = zeros(length(G1),length(G2));
 old_eventlist = [];
 Sim12 = similarity(UnG1, UnG2)
 Sim21 = similarity(UnG2, UnG1)
 # End Inizializzation------


# Main Simulation
# Simulation Runs
 for eph = 1:Neph
  [next_mx, next_eventlist] = sis_step( eph, old_mx, old_eventlist,G1, G2, UnG1, UnG2, Sim12, Sim21, Temp1, Temp2);
  old_mx=next_mx;
  old_eventlist=next_eventlist;
 endfor

 mx=old_mx;
 eventlist=old_eventlist;
endfunction