#G1 = [0.25 0.9 0.99 0.4 0.5 0.87 0.95];
#G2 = [0.3 0.2 0.9 0.84 0.5 0.6 0.95 0.67 0.12];
#G1 = [.7 .9]
#G2 = [.3 .7 .2 .6]


G1= [29 12 0 39 0 1 12 0 0 0 69 205 44 238]
G1= G1./sum(G1)

G2= [0 0 0 0 0 16 6 0 1 27 2 97 14 62]
G2= G2./sum(G2)



[a b c]=sissim(2000,G1,G2,0.01,0.0008);

plot(c(:,1),c(:,2))