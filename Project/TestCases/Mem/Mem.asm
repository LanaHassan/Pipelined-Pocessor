5
100

;data segment
10
20
30
40
50
60
70

LDD R1,3
LDD R2,4
ADD R1,R2
STD R1,4
Push R2
Push R1
LDD R1,7
LDD R2,8
ADD R1,R2
Pop R1
pop R2

.100
RTI


