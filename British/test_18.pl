:- consult('british_family.pl').

% Test Set 18: sibling
% 1/ Is Prince William Duke of Cambridge the sibling of Prince Harry Duke of Sussex?
?- sibling('Prince William Duke of Cambridge', 'Prince Harry Duke of Sussex'). % True
 
% 2/ Is Princess Beatrice the sibling of Princess Eugenie?
?- sibling('Princess Beatrice', 'Princess Eugenie'). % True

% 3/ Who is the sibling of Prince Edward Earl of Wessex?
?- sibling(X, 'Prince Edward Earl of Wessex').
/*
X = 'Prince Charles of Wales' ;
X = 'Princess Anne' ;
X = 'Prince Andrew Duke of York' ;
*/