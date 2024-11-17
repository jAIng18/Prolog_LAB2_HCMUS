:- consult('british_family.pl').

% Test Set 16: grandson
% 1/ Is Prince Louis the grandson of HM Queen Elizabeth II?
?- grandson('Prince Louis', 'Hm Queen Elizabeth II').

% 2/ Is James Viscount Severn the grandson of Philip Duke of Edinburgh?
?- grandson('James Viscount Severn', 'Philip Duke of Edinburgh').

% 3/ Who is the grandson of Prince Charles of Wales?
?- grandson(X, 'Prince Charles of Wales').
