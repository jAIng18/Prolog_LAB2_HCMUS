:- consult('british_family.pl').

% Test Set 1: male
% 1/ Is Prince Harry male? 
?- male('Prince Harry Duke of Sussex'). % True

% 2/ Is Princess Anne male?
?- male('Princess Anne'). % False

% 3/ Who is male?
?- male(X).
/*
X = 'Philip Duke of Edinburgh' ;
X = 'Prince Charles of Wales' ;
X = 'Mark Phillips' ;
X = 'Prince Andrew Duke of York' ;
X = 'Prince Edward Earl of Wessex' ;
X = 'Timothy Laurence' ;
X = 'Edoardo Mapelli Mozzi' ;
X = 'Jack Brooksbank' ;
X = 'August Brooksbank' ;
X = 'James Viscount Severn' ;
X = 'Prince William Duke of Cambridge' ;
X = 'Prince Harry Duke of Sussex' ;
X = 'Peter Phillips' ;
X = 'Mike Tindall' ;
X = 'Lucas' ;
X = 'Prince George' ;
X = 'Prince Louis' ;
X = 'Archie Harrison'. 
*/