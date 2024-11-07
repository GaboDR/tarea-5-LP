% Caso base: si las listas estan vacias.
trozo([], _, _, []).

% Caso en que estamos fuera del intervalo a verificar el palindromo.
% Se verifica que la posicion C no esta en el intervalo, pasa el resro de la 
% lista y le suma 1 a la posicion para el llamado recursivo.
trozo([_ | T], [I, F], C, RET):-
    (C < I; C > F),
    C1 is C + 1,
    trozo(T, [I, F], C1, RET).

% Caso donde estamod en el intervalo, agrega la letra a la lista , se aumenta
% en 1 la posicion y se hace el llamdo recursivo con el resto de la lista.
%
% H: primera palabra de la lista.
% T: resto de la lista.
% I: inicion del intervalo.
% T: termino del intervalo.
% C: posicion actual de la palabra.
% RET: lista a gregar sub- palabra del intervalo.
trozo([ H| T], [I, F], C, [H|RET]):-
    C >= I,
    C =< F,
    C1 is C + 1,
    trozo(T, [I, F], C1, RET).

% Caso base: si las listas estan vacias.
vuelta([], []).

% Va dando vuelta la lista, pasando el H al final y haciendo append con la lista
% que va volteando recursivamente.
%
% H: primera palabra de la lista.
% T: resto de la lista.
% RET: lista a agregar palabra invertida.
% Invertir: lista donde se va invirtiendo la palabra. 
vuelta([H|T], RET):-
    vuelta(T, Ivertir),
    append(Ivertir, [H], RET).

% Le da la palabra a trozo para sacar el trozo a verificar, lo da vulta y compara
% si son iguales
%
% L: palabra a revisar.
% I: intervalo a revisa.
% O: sub - palabra original
% V: sub - palabra dada vuelta.
esPalindroma(L, I) :-
    trozo(L, I, 1, O),
    vuelta(O, V),
    O = V.

