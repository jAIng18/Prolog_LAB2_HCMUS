:- consult('british_family.pl').

% Test Set 17: granddaughter
% 1/ Is Princess Charlotte the granddaughter of HM Queen Elizabeth II?
?- granddaughter('Princess Charlotte', 'Hm Queen Elizabeth II'). % False

% 2/ Is Lilibet Diana the granddaughter of Prince Charles of Wales?
?- granddaughter('Lilibet Diana', 'Prince Charles of Wales'). % True

% 3/ Who is the granddaughter of Sarah Ferguson?
?- granddaughter(X, 'Sarah Ferguson'). % X = 'Sienna Elizabeth Mapelli Mozzi'\
