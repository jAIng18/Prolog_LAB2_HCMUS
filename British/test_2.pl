:- consult('british_family.pl').

% Test Set 2: deceased/
% 1/ Was Queen Elizabeth II deceased?
?- deceased('Hm Queen Elizabeth II'). %True

% 2/ Was Philip Duke of Edinburgh deceased?
?- deceased('Philip Duke of Edinburgh'). %True

% 3/ Was Prince Charles of Wales deceased?
?- deceased('Prince Charles of Wales'). %False
