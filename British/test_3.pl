:- consult('british_family.pl').

% Test 3: Female
% 1. Is Queen Elizabeth II female?
?- female('Hm Queen Elizabeth II'). % True

% 2. Is Prince Charles of Wales female?
?- female('Prince Charles of Wales'). % False

% 3. Who is female?
?- female(X).
/*
X = 'Hm Queen Elizabeth II' ;
X = 'Diana Princess of Wales' ;
X = 'Princess Anne' ;
X = 'Sarah Ferguson' ;
X = 'Sophie Countess of Wessex' ;
X = 'Camilla Duchess of Cornwall' ;
X = 'Princess Beatrice' ;
X = 'Princess Eugenie' ;
X = 'Lady Louise' ;
X = 'Sienna Elizabeth Mapelli Mozzi' ;
X = 'Catherine Duchess of Cambridge' ;
X = 'Meghan Duchess of Sussex' ;
X = 'Autumn Phillips' ;
X = 'Zara Tindall' ;
X = 'Princess Charlotte' ;
X = 'Lilibet Diana' ;
X = 'Savannah' ;
X = 'Isla' ;
X = 'Mia' ;
X = 'Lena'. 
*/