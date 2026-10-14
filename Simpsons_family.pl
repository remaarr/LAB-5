% ARTI 303 - Programming for AI
% Lab 5 - Task 1: Knowledge base for the Simpsons family tree
% Student: Rema alghamdi

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent(abraham, herb).
parent(abraham, homer).
parent(mona, homer).
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).
parent(homer, bart).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).
parent(selma, ling).



father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
son(X, Y) :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).
brother(X, Y) :- parent(P, X), parent(P, Y), male(X), X \= Y.
sister(X, Y) :- parent(P, X), parent(P, Y), female(X), X \= Y.
grandfather(X, Z) :- father(X, Y), parent(Y, Z).
aunt(X, Y) :- parent(P, Y), sister(X, P).
uncle(X, Y) :- parent(P, Y), brother(X, P).
cousin(X, Y) :- parent(PX, X), parent(PY, Y), parent(G, PX), parent(G, PY), PX \= PY.
ancestor(X, Z) :- parent(X, Z).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).
