%Number_11.7

%general

appenD([], List, List).
appenD([Head|Tail], List, [Head|ResultTail]):-
    appenD(Tail, List, ResultTail).

writeList([]):-!.
writeList([H|T]):-write(H),nl,writeList(T).

%general

checkS_down(X,R):-checkS(X,X,0,R),!.	

checkS_down(_,0,Q,R):-R is Q,!.

checkS_down(X,C,Q,R):-
	N_C is C - 1,
	X mod C =:= 0,
	N_Q is Q + 1,
	checkS(X,N_C,N_Q,R);
	N_C is C - 1,
	checkS(X,N_C,Q,R).
	
sumS_down(_,0,S):- write(S),!.

sumS_down(X,C,S):-
	N_C is C - 1,
	X mod C =:= 0,
	checkS(C,R),
	R =:= 2,
	N_S is S + C,
	sumS(X,N_C,N_S);
	N_C is C - 1,
	sumS(X,N_C,S).

sumS_down(X):- sumS(X,X,0),!.

%Number_12.7

sumNu(X,RES):- sumNu(X,0,RES),!.

sumNu(0,S,RES):- RES is S,!.

sumNu(X,S,RES):-
	N_X is X div 10,
	N_S is S + X mod 10,
	sumNu(N_X,N_S,RES).

multDiv(X):- multDiv(X,X,1),!.

multDiv(_,0,M):- write(M),!.

multDiv(X,ACC,M):-
	N_ACC is ACC-1,
	X mod ACC =:= 0,
	sumNu(X,S1),
	sumNu(ACC,S2),
	S2 < S1,
	N_M is M * ACC,
	multDiv(X,N_ACC,N_M);
	N_ACC is ACC-1,
	multDiv(X,N_ACC,M).
%Number_14.7

listLenght([],L):- write(L),!.

listLenght([_|T],L):- N_L is L+1,listLenght(T,N_L).

listLenght([H|T]):-listLenght([H|T],0).

%Number_16.11

prom(Now,[H|T],R):- prom(Now,[H|T],R,0),!.

prom(Now,[H|T],R,Q):-
	Now =:= H,
	N_Q is Q + 1,
	prom(Now,T,R,N_Q);
	prom(Now,T,R,Q).

prom(_,[],R,Q):- R is Q.

findUnique([H|T]):- findUnique([H|T],[H|T],El).

findUnique([H|T],COPY,El):-
	prom(H,COPY,RES),
	RES =:= 1,
	El is H,
	findUnique([],El);
	findUnique(T,COPY,El).
	
findUnique([],El):- write(El).

%Number_17.17

tfindMin([H|T],Min,InMi,Cmin,Cin):-tfindMin([H|T],Min,InMi,Cmin,Cin,0).

tfindMin([H|T],Min,InMi,Cmin,Cin,Q):-
	H < Min,
	N_Min is H,
	N_InMi is Q,
	N_Q is Q + 1,
	tfindMin(T,N_Min,N_InMi,Cmin,Cin,N_Q);
	N_Q is Q + 1, 
	tfindMin(T,Min,InMi,Cmin,Cin,N_Q).

tfindMin([],Min,InMi,Cmin,Cin,Q):-Cmin is Min, Cin is InMi.

tfindMax([H|T],Max,InMa,Cmax,Cin):-tfindMax([H|T],Max,InMa,Cmax,Cin,0).

tfindMax([H|T],Max,InMa,Cmax,Cin,Q):-
	H > Max,
	N_Max is H,
	N_InMa is Q,
	N_Q is Q + 1,
	tfindMax(T,N_Max,N_InMa,Cmax,Cin,N_Q);
	N_Q is Q + 1, 
	tfindMax(T,Max,InMa,Cmax,Cin,N_Q).

tfindMax([],Max,InMa,Cmax,Cin,Q):-Cmax is Max, Cin is InMa.

tswapMinMax([],_,_,_,_,_,ACC):-writeList(ACC).

tswapMinMax([H|T],Cmin,Cin,Cmax,Cin2,Q,ACC):-
	Q =:= Cin,
	appenD(ACC,[Cmax],N_ACC),
	N_Q is Q + 1,
	tswapMinMax(T,Cmin,Cin,Cmax,Cin2,N_Q,N_ACC);
	Q =:= Cin2,
	appenD(ACC,[Cmin],N_ACC),
	N_Q is Q + 1,
	tswapMinMax(T,Cmin,Cin,Cmax,Cin2,N_Q,N_ACC);
	appenD(ACC,[H],N_ACC),
	N_Q is Q + 1,
	tswapMinMax(T,Cmin,Cin,Cmax,Cin2,N_Q,N_ACC).
	
tswapMinMax([H|T]):- tfindMin([H|T],H,0,Cmin,Cin),tfindMax([H|T],H,0,Cmax,Cin2),tswapMinMax([H|T],Cmin,Cin,Cmax,Cin2,0,[]).
%Number_18.19

listL([],L,R):- R is L.

listL([_|T],L,R):- N_L is L+1,listL(T,N_L,R).

listL([H|T],R):-listL([H|T],0,R).

shiftRight([],_,_,ACC):- writeList(ACC).

shiftRight([Head|Tail],Shift,I,ACC):-
	I < Shift,
	appenD(ACC,[Head],N_ACC),
	N_I is I + 1,
	shiftRight(Tail,Shift,N_I,N_ACC);
	appenD([Head],ACC,N_ACC),
	N_I is I + 1,
	shiftRight(Tail,Shift,N_I,N_ACC).

shiftRight([Head|Tail]):- listL([Head|Tail],Lenght),Shift is Lenght - 1, shiftRight([Head|Tail],Shift,0,[]).

%Number_19.31
evenQ([H|T]):-evenQ([H|T],0).

evenQ([],Q):-write(Q).

evenQ([H|T],Q):-
	H mod 2 =:= 0,
	N_Q is Q + 1,
	evenQ(T,N_Q);
	evenQ(T,Q).

%Number_20.34

segment([],_,_,ACC):-writeList(ACC).

segment([H|T],A,B,ACC):-
	H >= A,
	H =< B,
	appenD(ACC,[H],N_ACC),
	segment(T,A,B,N_ACC);
	segment(T,A,B,ACC).
	
%segment([1,25,32,4,6,78,12,-8,5,40],20,40)	

segment([H|T],A,B):- segment([H|T],A,B,[]).
	