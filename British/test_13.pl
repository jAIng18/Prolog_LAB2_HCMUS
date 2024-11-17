:- consult('british_family.pl').

% Test Set 13: grandfather
% 1/ Is Philip Duke of Edinburgh the grandfather of Prince Harry Duke of Sussex?
?- grandfather('Philip Duke of Edinburgh', 'Prince Harry Duke of Sussex').

% 2/ Is Prince Charles of Wales the grandfather of Prince George?
?- grandfather('Prince Charles of Wales', 'Prince George').

% 3/ Who is the grandfather of Princess Eugenie?
?- grandfather(X, 'Princess Eugenie').
