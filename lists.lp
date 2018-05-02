/*
 *  Helpers for dealing with lists.
 */

% do not use to generate lists!
_length(List, Len) :- _length(List, 0, Len).
_length([], Len, Len).
_length([_|List], LenSoFar, FinalLen) :-
    NextLen is 1 + LenSoFar,
    _length(List, NextLen, FinalLen).

% do not use to measure the sizes of lists!
_htgnel(Len, List) :- _htgnel(Len, 0, List).
_htgnel(Len, Len, []).
_htgnel(GoalLen, LenSoFar, [_|List]) :-
    LenSoFar < GoalLen,
    NextLen is LenSoFar + 1,
    _htgnel(GoalLen, NextLen, List).

_append([], List, List).
_append([E|Left], Right, [E|Final]) :-
    _append(Left, Right, Final).

_member(X, [X|_]).
_member(X, [_|Sublist]) :- _member(X, Sublist).

_select(Element, [Element|List], List).
_select(Element, [Stays|Sublist], [Stays|Remainder]) :-
    _select(Element, Sublist, Remainder).
