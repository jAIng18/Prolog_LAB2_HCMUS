:- consult('british_family.pl').

% Test 9: Child
% 1. Is Prince George the child of Prince William Duke of Cambridge?
?- child('Prince George', 'Prince William Duke of Cambridge').

% 2. Is Princess Anne the child of Queen Elizabeth II?
?- child('Princess Anne', 'Hm Queen Elizabeth II').

% 3. Who is the child of Prince Andrew Duke of York?
?- child(X, 'Prince Andrew Duke of York').
