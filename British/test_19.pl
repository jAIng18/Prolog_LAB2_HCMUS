:- consult('british_family.pl').

% Test Set 19: brother
% 1/ Is Prince Harry Duke of Sussex the brother of Prince William Duke of Cambridge?
?- brother('Prince Harry Duke of Sussex', 'Prince William Duke of Cambridge').

% 2/ Is Prince Andrew Duke of York the brother of Princess Anne?
?- brother('Prince Andrew Duke of York', 'Princess Anne').

% 3/ Who is the brother of Princess Eugenie?
?- brother(X, 'Princess Eugenie').
