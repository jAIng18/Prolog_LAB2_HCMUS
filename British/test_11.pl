:- consult('british_family.pl').

% Test Set 11: daughter
% 1/ Is Princess Charlotte the daughter of Prince William Duke of Cambridge?
?- daughter('Princess Charlotte', 'Prince William Duke of Cambridge'). % True

% 2/ Is Peter Phillip the daughter of Sarah Ferguson?
?- daughter('Peter Phillip', 'Sarah Ferguson'). % False

% 3/ Who is the daughter of Princess Anne?
?- daughter(X, 'Princess Anne'). % X = Zara Tindall 
