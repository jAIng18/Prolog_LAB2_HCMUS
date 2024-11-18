:- consult('british_family.pl').

% Test Set 15: grandchild
% 1/ Is Prince George the grandchild of HM Queen Elizabeth II?
?- grandchild('Prince George', 'Hm Queen Elizabeth II'). % False

% 2/ Is Archie Harrison the grandchild of Prince Charles of Wales?
?- grandchild('Archie Harrison', 'Prince Charles of Wales'). % True

% 3/ Who is the grandchild of Philip Duke of Edinburgh?
?- grandchild(X, 'Philip Duke of Edinburgh').
/*
X = 'Prince William Duke of Cambridge' ;
X = 'Prince Harry Duke of Sussex' ;
X = 'Camilla Duchess of Cornwall' ;
X = 'Peter Phillips' ;
X = 'Zara Tindall' ;
X = 'Timothy Laurence' ;
X = 'Princess Beatrice' ;
X = 'Princess Eugenie' ;
X = 'Lady Louise' ;
X = 'James Viscount Severn'.
*/