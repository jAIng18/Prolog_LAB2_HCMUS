:- consult('british_family.pl').

% Test 9: Child
% 1. Is Prince George the child of Prince William Duke of Cambridge?
?- child('Prince George', 'Prince William Duke of Cambridge'). % True
 
% 2. Is Princess Anne the child of Queen Elizabeth II?
?- child('Princess Anne', 'Hm Queen Elizabeth II'). % True

% 3. Who is the child of Prince Andrew Duke of York?
?- child(X, 'Prince Andrew Duke of York').
/*
X = 'Princess Beatrice' ;
X = 'Princess Eugenie'.
*/