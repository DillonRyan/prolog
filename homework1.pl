%Homework 1 - Patrick Dillon Ryan 17340382

% Add function. add(X, Y, Z) must receive X and Y in its simplest form.
add(0, X, X). % Base case: 0+X=X
add(s(X), Y, s(Z)) :- add(X, Y, Z). % Remove s.
add(p(X), Y, p(Z)) :- add(X, Y, Z). % Remove p.

numeral(0).
numeral(X+Y)  :- numeral(X), numeral(Y).
numeral(X-Y)  :- numeral(X), numeral(Y).
numeral(-X)   :- numeral(X).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).

% - Exercise 1,2,3,4,5,6
add2(0, 0, 0).
add2(-X, Y, Z) :- minus(X, A), add2(A, Y, Z).
add2(X, -Y, Z) :- minus(Y, A), add2(X, A, Z).

add2(A+B, Y, Z) :-     add2(A, B, X), add2(X, Y, Z).
add2(X, A+B, Z) :-     add2(A, B, Y), add2(X, Y, Z).

add2(A-B, Y, Z) :- subtract(A, B, X), add2(X, Y, Z).
add2(X, A-B, Z) :- subtract(A, B, Y), add2(X, Y, Z).

add2(X, s(p(Y)), Z) :- add2(X, Y, Z).
add2(X, p(s(Y)), Z) :- add2(X, Y, Z).
add2(s(p(X)), Y, Z) :- add2(X, Y, Z).
add2(p(s(X)), Y, Z) :- add2(X, Y, Z).
add2(s(X), p(Y), Z) :- add2(X, Y, Z).
add2(p(X), s(Y), Z) :- add2(X, Y, Z).

add2(s(X), Y, s(Z)) :- add2(X, Y, Z).
add2(X, s(Y), s(Z)) :- add2(X, Y, Z).
add2(p(X), Y, p(Z)) :- add2(X, Y, Z).
add2(X, p(Y), p(Z)) :- add2(X, Y, Z).

subtract(X, Y, Z) :- add2(X, -Y, Z). %subtract function. subtract (X,Y,Z) - returns (X - z) in Z
minus(-X, X).
minus(0, 0).
minus(A+B, Y) :-      add(A, B, X), minus(X, Y).
minus(A-B, Y) :- subtract(A, B, X), minus(X, Y).
minus(s(p(X)), Y) :- minus(X, Y).
minus(s(X), p(Y)) :- minus(X, Y).
minus(p(s(X)), Y) :- minus(X, Y).
minus(p(X), s(Y)) :- minus(X, Y).
