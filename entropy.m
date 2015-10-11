
fEnt = @(pdf) nansum(-log2(pdf).*pdf)  

fEnt([.5 .5])

fEnt([.75 .25])


p  = repmat(1/8, 1, 8)
fEnt(p)

p(1:4) = 0
fEnt(p)
nansum(-log2(p).*p)

p  = repmat(1/8, 1, 8); p(1) = 0; p = p/sum(p)
uncertaintyReduction = 3 - fEnt(p)



dt = .01;
t = [dt:dt:1000];   % define 
p = exppdf(t,50);
p = p/sum(p);
entExp = fEnt(p)  

p = gampdf(t,5,50/5);
entGam5 = fEnt(p/sum(p))


p = gampdf(t,20,50/20);
entGam20 = fEnt(p/sum(p))


p = lognpdf(t,3.412,1);
entLogn = fEnt(p/sum(p))

fprintf(1,'Dist:\tExp\tGam5\tGam20\tLogNormal\n')
fprintf(1,'     \t~~~\t~~~~\t~~~~~\t~~~~~~~~~\n')
fprintf(1,'     \t%.2f\t%.2f\t%.2f\t%.2f\n',entExp,entGam5,entGam20,entLogn)

