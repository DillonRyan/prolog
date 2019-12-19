%% Q1
s --> [2].
s --> u(Zeros), [2], v(Ones), {Zeros is 2*Ones}.
u(0) --> [].
u(Zeros) --> [0], u(Z), {Zeros is Z+1}.
u(Zeros) --> [1], u(Zeros).
v(0) --> [].
v(Ones) --> [1], v(O), {Ones is O+1}.
v(Ones) --> [0], v(Ones).

% Q2
s --> person(Col1, Nat1, Pet1), person(Col2, Nat2, Pet2), person(Col3 ,Nat3, Pet3),
{Col1 \== Col2, Col1 \== Col3, Col2 \== Col3,
 Nat1 \== Nat2, Nat1 \== Nat3, Nat2 \== Nat3,
 Pet1 \== Pet2, Pet1 \== Pet3, Pet2 \== Pet3}.

person(Col, Nat, Pet) --> col(Col), nat(Nat), pet(Pet).

col('red') --> [red].
col('blue') --> [blue].
col('green') --> [green].

nat('english') --> [english].
nat('spanish') --> [spanish].
nat('japanese') --> [japanese].

pet('snail') --> [snail].
pet('jaguar') --> [jaguar].
pet('zebra') --> [zebra].

% Q3
mkList(0, []).
mkList(Num, [Num|List]) :- Temp is Num-1, Num > 0, mkList(Temp, List).

s(0) --> [].
s(Num) --> {mkList(Num, List)}, [Temp], {member(Temp, List)}, {Remainder is Num-Temp}, s(Remainder).
