man(kazimir).
man(kallistratus).
man(kondrat).
man(cornelius).
man(konstantin).
man(kuzma).
man(kapiton).

woman(karolina).
woman(kira).
woman(kristina).
woman(catherine).
woman(ksenia).
woman(britney).
woman(claudia).
woman(brunhilda).
woman(tanya).

parent(karolina,catherine).
parent(karolina,ksenia).
parent(karolina,kuzma).
parent(kazimir,catherine).
parent(kazimir,ksenia).
parent(kazimir,kuzma).

parent(kallistratus,cornelius).
parent(kallistratus,britney).
parent(kira,cornelius).
parent(kira,britney).

parent(kristina,claudia).
parent(kristina,konstantin).
parent(kondrat,claudia).
parent(kondrat,konstantin).

parent(ksenia,kapiton).
parent(cornelius,kapiton).

parent(britney,brunhilda).
parent(britney,tanya).
parent(konstantin,brunhilda).
parent(konstantin,tanya).

%Number_11.7
father(X,Y):- man(X),parent(X,Y).
father(X):- parent(Y,X),man(Y),write(Y),nl.

%Number_12.7
sister(X,Y):- woman(X),parent(Z,X),parent(Z,Y).
sister(X):- sister(Y,X),woman(Y),write(Y),nl.

%Number_13.7
grand_so(X,Y):- man(X),parent(Y,X_Par),parent(X_Par,X).
grand_sons(X):- parent(X,G_Par),parent(G_Par,Son),man(Son),write(Son).

%Number_14.7
grand_ma_and_son(X,Y):- 
	woman(X),man(Y),parent(X,Y_Par),parent(Y_Par,Y).
	
grand_ma_and_son_or(X,Y):- 
	grand_ma_and_son(X,Y);grand_ma_and_son(Y,X).
	
%Number_15.7
mult(X,Y):- X<10, Y is X.
mult(X,Y):- N_X is X div 10, mult(N_X,Y1), Y is (X mod 10) * Y1.
mult(X):- mult(X,Y), write(Y).
	
%Number_16.7
mult_down(0,Y):- write(Y).
mult_down(X,Y):- N_X is (X div 10), N_Y is (Y * (X mod 10)), mult_down(N_X,N_Y).
mult_down(X):- mult_down(X,1).

%Number_17.7
countDig(0,0):-!.
countDig(X,Y):- X1 is X div 10, P is X mod 10,
    countDig(X1,Y1), (P>3,P mod 2 =\=0 -> Y is Y1+1;Y is Y1).
	
%Number_18.7
countDigD(X,Y):-  countDigD(X,Y,0),!.
countDigD(X,Y,Count):- X>0,!,
    X1 is X div 10,
    P is X mod 10,
    (P>3,P mod 2 =\= 0 -> Count1 is Count + 1; Count1 is Count),
    countDigD(X1,Y,Count1).
countDigD(_,Y,Z):- Y is Z.