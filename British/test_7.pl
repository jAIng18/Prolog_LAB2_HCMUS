:- consult('british_family.pl').

% Test 7: Father
% 1. Is Prince Charles of Wales the father of Prince Harry Duke of Sussex?
?- father('Prince Charles of Wales', 'Prince Harry Duke of Sussex'). % True

% 2. Is Philip Duke of Edinburgh the father of Princess Anne?
?- father('Philip Duke of Edinburgh', 'Princess Anne'). % True

% 3. Who is the father of Prince William Duke of Cambridge?
?- father(X, 'Prince William Duke of Cambridge'). % X = 'Prince Charles of Wales'.
