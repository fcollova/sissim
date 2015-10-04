# Simulation Next Step computation Function
function [next_mx, next_eventlist]=sis_step(eph, old_mx, old_eventlist,G1, G2, UnG1, UnG2, Sim12, Sim21, Temp1, Temp2)
 next_mx = old_mx;
 next_eventlist = old_eventlist;

 for i = 1:length(G1) 
   if( rand <= Temp1*UnG1(i))
     j= Sim12(i,1);
     next_mx(i,j) =  next_mx(i,j) + 1;
     next_eventlist = [next_eventlist; [eph 1 i j] ];
   endif 
 endfor
 for j =  1:length(G2) 
   if( rand <= Temp2*UnG2(i))
     i= Sim21(j,1);
     next_mx(i,j) =  next_mx(i,j) + 1;
     next_eventlist = [next_eventlist; [eph 2 j i] ];
   endif 
 endfor
end