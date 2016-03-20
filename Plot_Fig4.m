set (0, "defaultaxesfontname", "Helvetica") 
set (0, "defaultaxesfontsize", 16) 
set (0, "defaulttextfontname", "Helvetica") 
set (0, "defaulttextfontsize", 16) 

#-------------------21------------------
filename='Fig4_dati_G12.csv';
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
G12=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file


filename='Fig4_dati_G21.csv';
fid=fopen(filename,'r'); %open file for read
formatSpec='%d %d';
sizeA = [2 Inf];
G21=fscanf(fid,formatSpec,sizeA )' ; 
fclose(fid); %close file

%x=G12(:,1);
%y=G12(:,2);
%% Breaks
%pp = splinefit(x, y);
%plot(x, ppval(pp, x) );

hold on
plot(G12(:,1), G12(:,2),'color', 'r', "linewidth", 2 )
plot(G21(:,1), G21(:,2),'color', 'b', "linewidth", 2 )
xlabel ("Day",'FontSize', 16);
ylabel ("Number of Events",'FontSize', 16);
legend ("From G1 to G2", "From G2 to G1");






