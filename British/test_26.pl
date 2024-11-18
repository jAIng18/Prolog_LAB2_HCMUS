:- consult('british_family.pl').

% Test Set 26: married
% 1/ Is Prince Charles of Wales married to Camilla Duchess of Cornwall?
?- married('Prince Charles of Wales', 'Camilla Duchess of Cornwall'). % False

% 2/ Is Prince William Duke of Cambridge married to X?
?- married('Prince William Duke of Cambridge', X). % X = 'Catherine Duchess of Cambridge'.

% 3/ Who is married to Meghan Duchess of Sussex?
?- married(X, 'Meghan Duchess of Sussex'). % X = 'Prince Harry Duke of Sussex'.
