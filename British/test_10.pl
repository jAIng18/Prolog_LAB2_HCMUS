:- consult('british_family.pl').

% Test Set 10: son/
% 1/ Is Prince Edward Earl of Wessex the son of HM Queen Elizabeth II?
?- son('Prince Edward Earl of Wessex', 'Hm Queen Elizabeth II'). % True

% 2/ Is Mia the son of Catherine Duchess of Cambridge? 
?- son('Mia', 'Catherine Duchess of Cambridge'). % False

% 3/ Who is the son of Prince Charles of Wales?
?- son(X, 'Prince Charles of Wales').
/*
X = 'Prince William Duke of Cambridge' ;
X = 'Prince Harry Duke of Sussex' ;
*/