# Simulation Next Step computation Function
function [Loutnext_mx, Linnext_mx, next_eventlist]=sis_step(eph,R, Loutold_mx, Linold_mx, old_eventlist,G1, G2, UnG1, UnG2, Sim12, Sim21, Temp1, Temp2)
 Loutnext_mx = Loutold_mx;
 Linnext_mx = Linold_mx;
 next_eventlist = old_eventlist;

 for i = 1:length(G1)
   if( rand <= Temp1 * UnG1(i))
     j= Sim12(i,unidrnd(R)); #Changhe the value to have a wider choice
     Loutnext_mx(i,j) =  Loutnext_mx(i,j) + 1;
     next_eventlist = [next_eventlist; [eph 1 i j] ];
   endif 
 endfor
 for j =  1:length(G2)
   if( rand <= Temp2 * UnG2(j))
     i= Sim21(j,unidrnd(R)); #Changhe the value to have a wider choice
     Linnext_mx(j,i) =  Linnext_mx(j,i) + 1;
     next_eventlist = [next_eventlist; [eph 2 j i] ];
   endif 
 endfor
end