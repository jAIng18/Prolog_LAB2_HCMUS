:- consult('british_family.pl').

% Test 4: Parent
% 1. Is Prince William Duke of Cambridge the parent of Prince George?
?- parent('Prince William Duke of Cambridge', 'Prince George').

% 2. Is Queen Elizabeth II the parent of Princess Anne?
?- parent('Hm Queen Elizabeth II', 'Princess Anne').

% 3. Who is the parent of Prince Charles of Wales?
?- parent(X, 'Prince Charles of Wales').
