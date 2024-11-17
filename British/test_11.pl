:- consult('british_family.pl').

% Test Set 11: daughter
% 1/ Is Princess Charlotte the daughter of Prince William Duke of Cambridge?
?- daughter('Princess Charlotte', 'Prince William Duke of Cambridge').

% 2/ Is Princess Beatrice the daughter of Sarah Ferguson?
?- daughter('Princess Beatrice', 'Sarah Ferguson').

% 3/ Who is the daughter of Princess Anne?
?- daughter(X, 'Princess Anne').
