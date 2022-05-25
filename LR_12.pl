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
