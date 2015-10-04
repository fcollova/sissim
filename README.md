# SIS Simulator (F.Collovà)



## Usage
Neph: number of Epoch to run

G1,G2: Centrality row vectors of two networks

Temp1,Temp2: [0 1] internal temperature probability

[mx eventlist] = sissim(Neph, G1,G2, Temp1, Temp2)

ms: returns the number o events between the couple of nodes (i j)
eventlist: returns the eventlist in row form: (#ofEpoch, #ofGroupOriginating, i , j)

## Developing



### Tools

