:- consult('british_family.pl').

% Test Set 20: sister
% 1/ Is Princess Anne the sister of Prince Charles of Wales?
?- sister('Princess Anne', 'Prince Charles of Wales'). % True

% 2/ Is Princess Beatrice the sister of Princess Eugenie?
?- sister('Princess Beatrice', 'Princess Eugenie'). % True

% 3/ Who is the sister of Prince Edward Earl of Wessex?
?- sister(X, 'Prince Edward Earl of Wessex'). % X = 'Princess Anne'
