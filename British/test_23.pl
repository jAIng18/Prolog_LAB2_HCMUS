:- consult('british_family.pl').

% Test Set 23: niece
% 1/ Is Princess Beatrice the niece of Princess Anne?
?- niece('Princess Beatrice', 'Princess Anne'). % True

% 2/ Is Lady Louise the niece of Prince Charles of Wales?
?- niece('Lady Louise', 'Prince Charles of Wales'). % True

% 3/ Who is the niece of Prince Edward Earl of Wessex?
?- niece(X, 'Prince Edward Earl of Wessex').
/*
X = 'Camilla Duchess of Cornwall' ;
X = 'Zara Tindall' ;
X = 'Princess Beatrice' ;
X = 'Princess Eugenie' ;
*/
