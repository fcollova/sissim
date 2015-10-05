function nrec = nrecpty(eventls)
 ev1 = eventls(eventls(:,2)==1,:);
 ev2 = eventls(eventls(:,2)==2,:);

 ev1 = unique(ev1(:,3:4),'rows');
 ev2 = unique(ev2(:,3:4),'rows');
 tv2 = fliplr(ev1);
 tf = ismember(ev2,tv2, 'rows');
 nrec = sum(tf);