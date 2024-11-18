:- consult('british_family.pl').

% Test 8: Mother
% 1. Is Diana Princess of Wales the mother of Prince William Duke of Cambridge?
?- mother('Diana Princess of Wales', 'Prince William Duke of Cambridge'). % True

% 2. Is Catherine Duchess of Cambridge the mother of Prince George?
?- mother('Catherine Duchess of Cambridge', 'Prince George'). % True

% 3. Who is the mother of Princess Beatrice?
?- mother(X, 'Princess Beatrice'). % X = 'Sarah Ferguson'.
