:- consult('british_family.pl').

% Test Set 25: divorced
% 1/ Is Prince Charles of Wales divorced from Diana Princess of Wales?
?- divorced('Prince Charles of Wales', 'Diana Princess of Wales'). % True

% 2/ Is Prince Andrew Duke of York divorced from Sarah Ferguson?
?- divorced('Prince Andrew Duke of York', 'Sarah Ferguson'). % True

% 3/ Who is divorced from Sophie Countess of Wessex?
?- divorced(X, 'Sophie Countess of Wessex'). % False vì Sophie Countess of Wessex chưa ly dị
