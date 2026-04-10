add(A, B, Sum) :- Sum is A + B.

factorial(0, 1).
factorial(N, F) :- N > 0, N1 is N - 1, factorial(N1, F1), F is N * F1.
is_even(N) :- 0 is N mod 2.
member_of(X, [X|_]).
member_of(X, [_|Tail]) :- member_of(X, Tail).
intersection([], _, []).
intersection([H|T], L2, [H|Res]) :- member_of(H, L2), !, intersection(T, L2, Res).
intersection([_|T], L2, Res) :- intersection(T, L2, Res).
union([], L, L).
union([H|T], L, Res) :- member_of(H, L), !, union(T, L, Res).
union([H|T], L, [H|Res]) :- union(T, L, Res).
