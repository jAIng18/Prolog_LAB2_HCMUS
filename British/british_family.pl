:- discontiguous male/1.
:- discontiguous female/1.

% Description: This contains predicates about British Royal Family.
% Sex
male('Philip Duke of Edinburgh').
female('Hm Queen Elizabeth II').

male('Prince Charles of Wales').
female('Diana Princess of Wales').
female('Princess Anne').
male('Mark Phillips').
male('Prince Andrew Duke of York').
female('Sarah Ferguson').
male('Prince Edward Earl of Wessex').
female('Sophie Countess of Wessex').

female('Camilla Duchess of Cornwall').
male('Timothy Laurence').
female('Princess Beatrice').
male('Edoardo Mapelli Mozzi').
female('Princess Eugenie').
male('Jack Brooksbank').
female('Lady Louise').

female('Sienna Elizabeth Mapelli Mozzi').
male('August Brooksbank').
male('James Viscount Severn').

male('Prince William Duke of Cambridge').
female('Catherine Duchess of Cambridge').
male('Prince Harry Duke of Sussex').
female('Meghan Duchess of Susses').
male('Peter Phillips').
female('Autumn Phillips').
female('Zara Tindall').
male('Mike Tindall').

male('Prince George').
female('Princess Charlotte').
male('Prince Louis').
male('Archie Harrison').
female('Lilibet Diana').
female('Savannah').
female('Isla').
female('Mia').
female('Lena').
male('Lucas').

% Parent
parent('Hm Queen Elizabeth II','Prince Charles of Wales').
parent('Hm Queen Elizabeth II','Princess Anne').
parent('Hm Queen Elizabeth II','Prince Andrew Duke of York').
parent('Hm Queen Elizabeth II','Prince Edward Earl of Wessex').
parent('Philip Duke of Edinburgh','Prince Charles of Wales').
parent('Philip Duke of Edinburgh','Princess Anne').
parent('Philip Duke of Edinburgh','Prince Andrew Duke of York').
parent('Philip Duke of Edinburgh','Prince Edward Earl of Wessex').

parent('Diana Princess of Wales','Prince William Duke of Cambridge').
parent('Diana Princess of Wales','Prince Harry Duke of Sussex').
parent('Prince Charles of Wales','Prince William Duke of Cambridge').
parent('Prince Charles of Wales','Prince Harry Duke of Sussex').
parent('Prince Charles of Wales','Camilla Duchess of Cornwall').

parent('Mark Phillips','Peter Phillips').
parent('Mark Phillips','Zara Tindall').
parent('Princess Anne','Peter Phillips').
parent('Princess Anne','Zara Tindall').
parent('Princess Anne','Timothy Laurence').

parent('Sarah Ferguson','Princess Beatrice').
parent('Sarah Ferguson','Princess Eugenie').
parent('Prince Andrew Duke of York','Princess Beatrice').
parent('Prince Andrew Duke of York','Princess Eugenie').

parent('Prince Edward Earl of Wessex','Lady Louise').
parent('Prince Edward Earl of Wessex','James Viscount Severn').
parent('Sophie Countess of Wessex','Lady Louise').
parent('Sophie Countess of Wessex','James Viscount Severn').

parent('Princess Beatrice','Sienna Elizabeth Mapelli Mozzi').
parent('Edoardo Mapelli Mozzi','Sienna Elizabeth Mapelli Mozzi').

parent('Princess Eugenie','August Brooksbank').
parent('Jack Brooksbank','August Brooksbank').

parent('Prince William Duke of Cambridge','Prince George').
parent('Prince William Duke of Cambridge','Princess Charlotte').
parent('Prince William Duke of Cambridge','Prince Louis').
parent('Catherine Duchess of Cambridge','Prince George').
parent('Catherine Duchess of Cambridge','Princess Charlotte').
parent('Catherine Duchess of Cambridge','Prince Louis').

parent('Prince Harry Duke of Sussex','Archie Harrison').
parent('Meghan Duchess of Susses','Archie Harrison').
parent('Prince Harry Duke of Sussex','Lilibet Diana').
parent('Meghan Duchess of Susses','Lilibet Diana').

parent('Peter Phillips','Savannah').
parent('Peter Phillips','Isla').
parent('Autumn Phillips','Savannah').
parent('Autumn Phillips','Isla').

parent('Zara Tindall','Mia').
parent('Zara Tindall','Lena').
parent('Mike Tindall','Mia').
parent('Mike Tindall','Lena').
parent('Zara Tindall','Lucas').
parent('Mike Tindall','Lucas').

% Deceased
deceased('Hm Queen Elizabeth II').
deceased('Philip Duke of Edinburgh').
deceased('Diana Princess of Wales').

% Married
married('Hm Queen Elizabeth II','Philip Duke of Edinburgh').
married('Princess Anne','Mark Phillips').
married('Prince Andrew Duke of York','Sarah Ferguson').
married('Prince Edward Earl of Wessex','Sophie Countess of Wessex').

married('Princess Beatrice','Edoardo Mapelli Mozzi').
married('Princess Eugenie','Jack Brooksbank').

married('Prince William Duke of Cambridge','Catherine Duchess of Cambridge').
married('Prince Harry Duke of Sussex','Meghan Duchess of Susses').
married('Zara Tindall','Mike Tindall').

married('Philip Duke of Edinburgh', 'Hm Queen Elizabeth II').
married('Mark Phillips', 'Princess Anne').
married('Sarah Ferguson', 'Prince Andrew Duke of York').
married('Sophie Countess of Wessex', 'Prince Edward Earl of Wessex').

married('Edoardo Mapelli Mozzi', 'Princess Beatrice').
married('Jack Brooksbank', 'Princess Eugenie').

married('Catherine Duchess of Cambridge', 'Prince William Duke of Cambridge').
married('Meghan Duchess of Sussex', 'Prince Harry Duke of Sussex').
married('Mike Tindall', 'Zara Tindall').


% Divorced
divorced('Prince Charles of Wales', 'Diana Princess of Wales').
divorced('Peter Phillips', 'Autumn Phillips').
divorced('Autumn Phillips', 'Peter Phillips').
divorced('Diana Princess of Wales', 'Prince Charles of Wales').

divorced('Princess Anne', 'Mark Phillips').
divorced('Prince Andrew Duke of York', 'Sarah Ferguson').
divorced('Mark Phillips', 'Princess Anne').
divorced('Sarah Ferguson', 'Prince Andrew Duke of York').

% Rules
husband(X,Y):-
    married(X,Y),
    male(X).

wife(X,Y):-
    married(X,Y),
    female(X).

father(X,Y):-
    parent(X,Y),
    male(X).

mother(X,Y):-
    parent(X,Y),
    female(X).

child(X,Y):-
    parent(Y,X).

son(X,Y):-
    child(X,Y),
    male(X).

daughter(X,Y):-
    child(X,Y),
    female(X).

grandparent(X,Y):-
    parent(X,Z),
    parent(Z,Y).

grandfather(X,Y):-
    grandparent(X,Y),
    male(X).

grandmother(X,Y):-
    grandparent(X,Y),
    female(X).

grandchild(X,Y):-
    grandparent(Y,X).

grandson(X,Y):-
    grandchild(Y,X),
    male(X).

granddaughter(X,Y):-
    grandchild(Y,X),
    female(X).

sibling(X,Y):-
    parent(Z,X),
    parent(Z,Y),
    X \= Y.

brother(X,Y):-
    sibling(X,Y),
    male(X).

sister(X,Y):-
    sibling(X,Y),
    female(X).

aunt(X,Y):-
    female(X),
    parent(Z,Y),
    (sister(X,Z); (brother(U,Z), wife(X, U))).

uncle(X,Y):-
    male(X),
    parent(Z,Y),
    (brother(X,Z); (sister(A,Z), husband(X, A))).

niece(X,Y):-
    (aunt(Y, X); uncle(Y,X)).
    female(X).

nephew(X,Y):-
    (aunt(Y, X); uncle(Y,X)).
    male(X).
