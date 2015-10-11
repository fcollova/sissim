# Simulation Next Step computation Function
function [G1next_mx, G2next_mx, next_eventlist]=sis_step(eph,R, G1old_mx,G2old_mx, old_eventlist,G1, G2, UnG1, UnG2, Sim12, Sim21, Temp1, Temp2)
 G1next_mx = G1old_mx;
 G2next_mx = G2old_mx;
 next_eventlist = old_eventlist;

 for i = 1:length(G1)
   if( rand <= Temp1 * UnG1(i))
     j= Sim12(i,unidrnd(R)); #Changhe the value to have a wider choice
     G1next_mx(i,j) =  G1next_mx(i,j) + 1;
     next_eventlist = [next_eventlist; [eph 1 i j] ];
   endif 
 endfor
 for j =  1:length(G2)
   if( rand <= Temp2 * UnG2(j))
     i= Sim21(j,unidrnd(R)); #Changhe the value to have a wider choice
     G2next_mx(j,i) =  G2next_mx(j,i) + 1;
     next_eventlist = [next_eventlist; [eph 2 j i] ];
   endif 
 endfor
end