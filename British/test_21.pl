:- consult('british_family.pl').

% Test Set 21: aunt
% 1/ Is Princess Anne the aunt of Prince William Duke of Cambridge?
?- aunt('Princess Anne', 'Prince William Duke of Cambridge').

% 2/ Is Sarah Ferguson the aunt of Lady Louise?
?- aunt('Sarah Ferguson', 'Lady Louise').

% 3/ Who is the aunt of Archie Harrison?
?- aunt(X, 'Archie Harrison').
