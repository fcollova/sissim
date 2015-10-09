 ev1 = b(b(:,2)==1,:)
 ev2 = b(b(:,2)==2,:)

 ev1u = unique(ev1(:,3:4),'rows')
 ev2u = unique(ev2(:,3:4),'rows')
 tv2 = fliplr(ev1)
 tf = ismember(ev2,tv2, 'rows')
 nrec = sum(tf)