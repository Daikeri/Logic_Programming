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
