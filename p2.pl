conexo(p12, p5, 2).
conexo(p5, p1, 7).
conexo(p11, p12, 3).
conexo(p11, p4, 7).
conexo(p1, p4, 1).
conexo(p4, c, 3).
conexo(p1, c, 4).
conexo(p10, p4, 6).
conexo(p2, p1, 3).
conexo(p6, p2, 2).
conexo(p7, p6, 4).
conexo(p7, p2, 3).
conexo(p2, p3, 7).
conexo(p3, c, 2).
conexo(p10, p3, 3).
conexo(p8, p3, 8).
conexo(p8, p9, 3).
conexo(p9, p10, 10).

camino(c, [c]).

camino(S, [S|RES]) :-
    conexo(S,X, _), 
    camino(X, RES).

combustible(c, V, [[c, V]]).


combustible(S, V, [[S, V]| RES]) :-
    conexo(S, X, C), 
    V >= C, 
    V1 is V - C,
    combustible(X, V1, RES).