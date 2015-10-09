filename='reci1.csv'; 
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
A=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file
plot(A(:,1),A(:,2))