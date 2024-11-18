:- consult('british_family.pl').

% Test Set 22: uncle
% 1/ Is Prince Andrew Duke of York the uncle of Prince William Duke of Cambridge?
?- uncle('Prince Andrew Duke of York', 'Prince William Duke of Cambridge'). % True
 
% 2/ Is Mark Phillips the uncle of Savannah?
?- uncle('Mark Phillips', 'Savannah'). % False

% 3/ Who is the uncle of Princess Charlotte?
?- uncle(X, 'Princess Charlotte'). % X = 'Prince Harry Duke of Sussex'
