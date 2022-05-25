%Number_11.7

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
