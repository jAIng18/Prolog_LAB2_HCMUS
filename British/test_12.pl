:- consult('british_family.pl').

% Test Set 12: grandparent
% 1/ Is HM Queen Elizabeth II the grandparent of Prince George?
?- grandparent('Hm Queen Elizabeth II', 'Prince George'). % False

% 2/ Is Philip Duke of Edinburgh the grandparent of Archie Harrison?
?- grandparent('Philip Duke of Edinburgh', 'Archie Harrison'). % False

% 3/ Who is the grandparent of Princess Charlotte?
?- grandparent(X, 'Princess Charlotte').
/*
X = 'Diana Princess of Wales' ;
X = 'Prince Charles of Wales' ;
*/