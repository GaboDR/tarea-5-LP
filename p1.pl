trozo([], _, _, []).

trozo([_ | T], [I, F], C, RET):-
    (C < I; C > F),
    C1 is C + 1,
    trozo(T, [I, F], C1, RET).

trozo([ H| T], [I, F], C, [H|RET]):-
    C >= I,
    C =< F,
    C1 is C + 1,
    trozo(T, [I, F], C1, RET).

vuelta([], []).

vuelta([H|T], RET):-
    vuelta(T, Ivertir),
    append(Ivertir, [H], RET).


esPalindroma(L, I) :-
    trozo(L, I, 1, O),
    vuelta(O, V),
    O = V.

