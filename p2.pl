% Descricion del grafo
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

% Caso base: si el nodo es c, lo agrego a la lista 

camino(c, [c]).

% Busca los caminos con conexo y pasa X como parametro para el llamado recursivo. 
% Agrega el nodo recibido a la lista del camino.
%
% S: nodo actua.
% X: vecino de S.
% RES: lista donde se agrega el camino.
camino(S, [S|RES]) :-
    conexo(S,X, _), 
    camino(X, RES).

% Caso base: llego a c con V combustible y lo agrego com sub - lista al retorno 
combustible(c, V, [[c, V]]).

% Verifica si el viaje es posible con el combustible actual, actualiza el combustible y 
% y se llama recursivamente con el vecino del nodo y el combustible disponible.
% Al inicio se agrea el nodo y el combustible actual a la lista.
%
% S: nodo actual.
% V: Combustible inicial.
% RES: lista donde agrego el camino y el costo.
% X: vecino de S.
% C: costo del camino.
% V1: combustible restante.
combustible(S, V, [[S, V]| RES]) :-
    conexo(S, X, C), 
    V >= C, 
    V1 is V - C,
    combustible(X, V1, RES).