:- consult('british_family.pl').

% Test 5: Husband
% 1. Is Prince Charles of Wales the husband of Camilla Duchess of Cornwall?
?- husband('Prince Charles of Wales', 'Camilla Duchess of Cornwall').

% 2. Is Philip Duke of Edinburgh the husband of Queen Elizabeth II?
?- husband('Philip Duke of Edinburgh', 'Hm Queen Elizabeth II').

% 3. Who is the husband of Meghan Duchess of Sussex?
?- husband(X, 'Meghan Duchess of Sussex').

