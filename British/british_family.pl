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
husband(Person,Wife):-
    married(Person,Wife),
    male(Person).

wife(Person,Husband):-
    married(Person,Husband),
    female(Person).

father(Parent,Child):-
    parent(Parent,Child),
    male(Parent).

mother(Parent,Child):-
    parent(Parent,Child),
    female(Parent).

child(Child,Parent):-
    parent(Parent,Child).

son(Child,Parent):-
    child(Child,Parent),
    male(Child).

daughter(Child,Parent):-
    child(Child,Parent),
    female(Child).

grandparent(GP,GC):-
    parent(GP,P),
    parent(P,GC).

grandfather(GF,GC):-
    grandparent(GF,GC),
    male(GF).

grandmother(GM,GC):-
    grandparent(GM,GC),
    female(GM).

grandchild(GC,GP):-
    grandparent(GP,GC).

grandson(GS,GP):-
    grandchild(GS,GP),
    male(GS).

granddaughter(GD,GP):-
    grandchild(GD,GP),
    female(GD).

sibling(Person1,Person2):-
    parent(Z,Person1),
    parent(Z,Person2),
    Person1 \= Person2.

brother(Person,Sibling):-
    sibling(Person,Sibling),
    male(Person).

sister(Person,Sibling):-
    sibling(Person,Sibling),
    female(Person).

aunt(Person,NieceNephew):-
    female(Person),
    parent(Z,NieceNephew),
    (sister(Person,Z); (brother(U,Z), wife(Person, U))).

uncle(Person,NieceNephew):-
    male(Person),
    parent(Z,NieceNephew),
    (brother(Person,Z); (sister(A,Z), husband(Person, A))).

niece(Person,AuntUncle):-
    (aunt(AuntUncle, Person); uncle(AuntUncle,Person)).
    female(Person).

nephew(Person,AuntUncle):-
    (aunt(AuntUncle, Person); uncle(AuntUncle,Person)).
    male(Person).
