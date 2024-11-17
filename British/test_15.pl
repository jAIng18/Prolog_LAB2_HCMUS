:- consult('british_family.pl').

% Test Set 15: grandchild
% 1/ Is Prince George the grandchild of HM Queen Elizabeth II?
?- grandchild('Prince George', 'Hm Queen Elizabeth II').

% 2/ Is Archie Harrison the grandchild of Prince Charles of Wales?
?- grandchild('Archie Harrison', 'Prince Charles of Wales').

% 3/ Who is the grandchild of Philip Duke of Edinburgh?
?- grandchild(X, 'Philip Duke of Edinburgh').
