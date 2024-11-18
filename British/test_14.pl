:- consult('british_family.pl').

% Test Set 14: grandmother
% 1/ Is HM Queen Elizabeth II the grandmother of Prince Louis?
?- grandmother('Hm Queen Elizabeth II', 'Prince Louis'). % False

% 2/ Is Diana Princess of Wales the grandmother of Prince George?
?- grandmother('Diana Princess of Wales', 'Prince George'). % True

% 3/ Who is the grandmother of Savannah?
?- grandmother(X, 'Savannah'). % X = 'Princess Anne' 
