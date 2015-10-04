# SIS Simulator (F.Collovà)



## Usage
Neph: number of Epoch to run

G1,G2: Centrality row vectors of two networks N1 & N2

Temp1,Temp2: [0 1] internal temperature probability

[mx eventlist] = sissim(Neph, G1,G2, Temp1, Temp2)

ms: returns the total number of events between the nodes of G1 & G2 in the form of a matrix len(G1) X len(G2)

eventlist: returns the eventlist in row form: (#ofEpoch, #ofGroupOriginating, i , j)

## Developing



### Tools

