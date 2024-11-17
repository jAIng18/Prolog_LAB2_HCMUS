:- consult('british_family.pl').

% Test Set 20: sister
% 1/ Is Princess Anne the sister of Prince Charles of Wales?
?- sister('Princess Anne', 'Prince Charles of Wales').

% 2/ Is Princess Beatrice the sister of Princess Eugenie?
?- sister('Princess Beatrice', 'Princess Eugenie').

% 3/ Who is the sister of Prince Edward Earl of Wessex?
?- sister(X, 'Prince Edward Earl of Wessex').
