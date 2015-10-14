# Data Value of Netwoks G1 & G2 are Centrality vector of i-th node

function [G1mx, G2mx, eventlist, precpty] = sissim(Neph, R, G1,G2, Temp1, Temp2)

% # Compute uniform distribution and regularize
% 
% UnG1 = unifcdf(G1',min(G1),max(G1));
% UnG2 = unifcdf(G2',min(G2),max(G2));
% UnG1(UnG1(:,1)==0,1) = 1/(length(UnG1));
% UnG2(UnG2(:,1)==0,1) = 1/(length(UnG2));
% UnG1 = UnG1';
% UnG2 = UnG2';
%

UnG1=G1;
UnG2=G2;

 # Inizializzation ---------
 
 # 2 Matrix of intergroup events  G1old_mx (G1->G2)  G2old_mx (G2->G1) rettangular
 G1old_mx = zeros(length(G1),length(G2));
 G2old_mx = zeros(length(G2),length(G1));
 
 old_eventlist = [];
 Sim12 = similarity(UnG1, UnG2);
 Sim21 = similarity(UnG2, UnG1);
 precpty = [];
 
 # End Inizializzation------


# Main Simulation
# Simulation Runs
 for eph = 1:Neph
  [G1next_mx, G2next_mx, next_eventlist] = sis_step( eph, R, G1old_mx, G2old_mx, old_eventlist,G1, G2, UnG1, UnG2, Sim12, Sim21, Temp1, Temp2);
  G1old_mx = G1next_mx;
  G2old_mx = G2next_mx;
  old_eventlist=next_eventlist;

  # -----insert here specific plotting on epoch
  if length(old_eventlist) > 0

   Lout_sum = sum(sum(G1old_mx));
   Lin_sum  = sum(sum(G2old_mx));
   Rplus = Lout_sum + Lin_sum;
   Rmin  = Lout_sum - Lin_sum;
   RplusT = Rplus/eph;
   RminT  = Rmin/eph;
   Rqt = Rmin/Rplus;
   RplusonT = Rplus/eph;
   RminonT =  Rmin/eph;
   RConT = sum(sum(min(G1old_mx, G2old_mx')))/eph;

   #Return plot variable
   precpty = [precpty; [eph nrecpty(old_eventlist) Rplus Rmin RplusT RminT Rqt (Rqt+1)/(Rqt-1) RplusonT RminonT RConT]];
   
  endif

  endfor

 G1mx = G1old_mx;
 G2mx = G2old_mx;
 eventlist=old_eventlist;
endfunction