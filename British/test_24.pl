:- consult('british_family.pl').

% Test Set 24: nephew
% 1/ Is Prince Harry Duke of Sussex the nephew of Princess Anne?
?- nephew('Prince Harry Duke of Sussex', 'Princess Anne'). % True

% 2/ Is James Viscount Severn the nephew of Prince Andrew Duke of York?
?- nephew('James Viscount Severn', 'Prince Andrew Duke of York'). % True

% 3/ Who is the nephew of Zara Tindall?
?- nephew(X, 'Zara Tindall'). % False 
