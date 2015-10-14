filename='reci1.csv'; 
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
A=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file
plot(A(:,1),A(:,2), '.', 'color', 'k', "markersize", 6 )
set (gca, 'xtick', 500:500:5000)
set (gca, 'ytick', 10:10:80)


filename='EPOCH-EVENT-cumulativi.csv'; 
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d %d %d %d';
sizeA = [5 Inf];
B=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file
plot(B(:,1),B(:,2), '.', 'color', 'k', "markersize", 6 )
set (gca, 'xtick', 500:500:5000)
set (gca, 'ytick', 10:10:80)
