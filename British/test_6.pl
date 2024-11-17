:- consult('british_family.pl').

% Test 6: Wife
% 1. Is Catherine Duchess of Cambridge the wife of Prince William Duke of Cambridge?
?- wife('Catherine Duchess of Cambridge', 'Prince William Duke of Cambridge').

% 2. Is Diana Princess of Wales the wife of Prince Charles of Wales?
?- wife('Diana Princess of Wales', 'Prince Charles of Wales').

% 3. Who is the wife of Philip Duke of Edinburgh?
?- wife(X, 'Philip Duke of Edinburgh').
