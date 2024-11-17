:- consult('british_family.pl').

% Test Set 10: son/
% 1/ Is Prince Edward Earl of Wessex the son of HM Queen Elizabeth II?
?- son('Prince Edward Earl of Wessex', 'Hm Queen Elizabeth II').

% 2/ Is Prince Louis the son of Catherine Duchess of Cambridge?
?- son('Prince Louis', 'Catherine Duchess of Cambridge').

% 3/ Who is the son of Prince Charles of Wales?
?- son(X, 'Prince Charles of Wales').
