
male('Karamchand Uttamchand Gandhi').
male('Mahatma Gandhi').
male('Harilal Gandhi').
male('Manilal Gandhi').
male('Ramdas Gandhi').
male('Devdas Gandhi').
male('Arun Manilal Gandhi').
male('Kanu Gandhi').
male('Rajmohan Gandhi').
male('Ramchandra Gandhi').
male('Gopalkrishna Gandhi').
male('Tushar Gandhi').

female('Kasturba Gandhi').
female('Sunanda Gandhi').
female('Ela Gandhi').
female('Leela Gandhi').

parent('Karamchand Uttamchand Gandhi', 'Mahatma Gandhi').
parent('Mahatma Gandhi', 'Harilal Gandhi').
parent('Mahatma Gandhi', 'Manilal Gandhi').
parent('Mahatma Gandhi', 'Ramdas Gandhi').
parent('Mahatma Gandhi', 'Devdas Gandhi').
parent('Kasturba Gandhi', 'Harilal Gandhi').
parent('Kasturba Gandhi', 'Manilal Gandhi').
parent('Kasturba Gandhi', 'Ramdas Gandhi').
parent('Kasturba Gandhi', 'Devdas Gandhi').


parent('Manilal Gandhi', 'Arun Manilal Gandhi').
parent('Manilal Gandhi', 'Ela Gandhi').
parent('Ramdas Gandhi', 'Kanu Gandhi').
parent('Devdas Gandhi', 'Rajmohan Gandhi').
parent('Devdas Gandhi', 'Ramchandra Gandhi').
parent('Devdas Gandhi', 'Gopalkrishna Gandhi').


parent('Arun Manilal Gandhi', 'Tushar Gandhi').
parent('Sunanda Gandhi', 'Tushar Gandhi').
parent('Ramchandra Gandhi', 'Leela Gandhi').

father(F, C) :- male(F), parent(F, C).
mother(M, C) :- female(M), parent(M, C).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

grandfather(GF, GC) :- male(GF), parent(GF, P), parent(P, GC).
grandmother(GM, GC) :- female(GM), parent(GM, P), parent(P, GC).

great_grandfather(GGF, GGC) :- male(GGF), parent(GGF, GF), parent(GF, P), parent(P, GGC).
