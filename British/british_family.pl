% Description: This contains predicates about British Royal Family.
% Sex
male('Philip Duke of Edinburgh').
male('Prince Charles of Wales').
male('Mark Phillips').
male('Prince Andrew Duke of York').
male('Prince Edward Earl of Wessex').
male('Timothy Laurence').
male('Edoardo Mapelli Mozzi').
male('Jack Brooksbank').
male('August Brooksbank').
male('James Viscount Severn').
male('Prince William Duke of Cambridge').
male('Prince Harry Duke of Sussex').
male('Peter Phillips').
male('Mike Tindall').
male('Lucas').
male('Prince George').
male('Prince Louis').
male('Archie Harrison').

female('Hm Queen Elizabeth II').
female('Diana Princess of Wales').
female('Princess Anne').
female('Sarah Ferguson').
female('Sophie Countess of Wessex').
female('Camilla Duchess of Cornwall').
female('Princess Beatrice').
female('Princess Eugenie').
female('Lady Louise').
female('Sienna Elizabeth Mapelli Mozzi').
female('Catherine Duchess of Cambridge').
female('Meghan Duchess of Sussex').
female('Autumn Phillips').
female('Zara Tindall').
female('Princess Charlotte').
female('Lilibet Diana').
female('Savannah').
female('Isla').
female('Mia').
female('Lena').

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
married('Prince Harry Duke of Sussex','Meghan Duchess of Sussex').
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
    (aunt(AuntUncle, Person); uncle(AuntUncle,Person)),
    female(Person).

nephew(Person,AuntUncle):-
    (aunt(AuntUncle, Person); uncle(AuntUncle,Person)),
    male(Person).


% Test Set 1: male
% 1/ Is Prince Harry male?
?- male('Prince Harry Duke of Sussex').

% 2/ Is Princess Anne male?
?- male('Princess Anne').

% 3/ Who is male?
?- male(X).

% Test Set 2: deceased/
% 1/ Was Queen Elizabeth II deceased?
?- deceased('Hm Queen Elizabeth II').

% 2/ Was Philip Duke of Edinburgh deceased?
?- deceased('Philip Duke of Edinburgh').

% 3/ Was Prince Charles of Wales deceased?
?- deceased('Prince Charles of Wales').

% Test 3: Female
% 1. Is Queen Elizabeth II female?
?- female('Hm Queen Elizabeth II').

% 2. Is Prince Charles of Wales female?
?- female('Prince Charles of Wales').

% 3. Who is female?
?- female(X).

% Test 4: Parent
% 1. Is Prince William Duke of Cambridge the parent of Prince George?
?- parent('Prince William Duke of Cambridge', 'Prince George').

% 2. Is Queen Elizabeth II the parent of Princess Anne?
?- parent('Hm Queen Elizabeth II', 'Princess Anne').

% 3. Who is the parent of Prince Charles of Wales?
?- parent(X, 'Prince Charles of Wales').

% Test 5: Husband
% 1. Is Prince Charles of Wales the husband of Camilla Duchess of Cornwall?
?- husband('Prince Charles of Wales', 'Camilla Duchess of Cornwall').

% 2. Is Philip Duke of Edinburgh the husband of Queen Elizabeth II?
?- husband('Philip Duke of Edinburgh', 'Hm Queen Elizabeth II').

% 3. Who is the husband of Meghan Duchess of Sussex?
?- husband(X, 'Meghan Duchess of Sussex').

% Test 6: Wife
% 1. Is Catherine Duchess of Cambridge the wife of Prince William Duke of Cambridge?
?- wife('Catherine Duchess of Cambridge', 'Prince William Duke of Cambridge').

% 2. Is Diana Princess of Wales the wife of Prince Charles of Wales?
?- wife('Diana Princess of Wales', 'Prince Charles of Wales').

% 3. Who is the wife of Philip Duke of Edinburgh?
?- wife(X, 'Philip Duke of Edinburgh').

% Test 7: Father
% 1. Is Prince Charles of Wales the father of Prince Harry Duke of Sussex?
?- father('Prince Charles of Wales', 'Prince Harry Duke of Sussex').

% 2. Is Philip Duke of Edinburgh the father of Princess Anne?
?- father('Philip Duke of Edinburgh', 'Princess Anne').

% 3. Who is the father of Prince William Duke of Cambridge?
?- father(X, 'Prince William Duke of Cambridge').

% Test 8: Mother
% 1. Is Diana Princess of Wales the mother of Prince William Duke of Cambridge?
?- mother('Diana Princess of Wales', 'Prince William Duke of Cambridge').

% 2. Is Catherine Duchess of Cambridge the mother of Prince George?
?- mother('Catherine Duchess of Cambridge', 'Prince George').

% 3. Who is the mother of Princess Beatrice?
?- mother(X, 'Princess Beatrice').

% Test 9: Child
% 1. Is Prince George the child of Prince William Duke of Cambridge?
?- child('Prince George', 'Prince William Duke of Cambridge').

% 2. Is Princess Anne the child of Queen Elizabeth II?
?- child('Princess Anne', 'Hm Queen Elizabeth II').

% 3. Who is the child of Prince Andrew Duke of York?
?- child(X, 'Prince Andrew Duke of York').

% Test Set 10: son/
% 1/ Is Prince Edward Earl of Wessex the son of HM Queen Elizabeth II?
?- son('Prince Edward Earl of Wessex', 'Hm Queen Elizabeth II').

% 2/ Is Prince Louis the son of Catherine Duchess of Cambridge?
?- son('Prince Louis', 'Catherine Duchess of Cambridge').

% 3/ Who is the son of Prince Charles of Wales?
?- son(X, 'Prince Charles of Wales').

% Test Set 11: daughter
% 1/ Is Princess Charlotte the daughter of Prince William Duke of Cambridge?
?- daughter('Princess Charlotte', 'Prince William Duke of Cambridge').

% 2/ Is Princess Beatrice the daughter of Sarah Ferguson?
?- daughter('Princess Beatrice', 'Sarah Ferguson').

% 3/ Who is the daughter of Princess Anne?
?- daughter(X, 'Princess Anne').

% Test Set 12: grandparent
% 1/ Is HM Queen Elizabeth II the grandparent of Prince George?
?- grandparent('Hm Queen Elizabeth II', 'Prince George').

% 2/ Is Philip Duke of Edinburgh the grandparent of Archie Harrison?
?- grandparent('Philip Duke of Edinburgh', 'Archie Harrison').

% 3/ Who is the grandparent of Princess Charlotte?
?- grandparent(X, 'Princess Charlotte').

% Test Set 13: grandfather
% 1/ Is Philip Duke of Edinburgh the grandfather of Prince Harry Duke of Sussex?
?- grandfather('Philip Duke of Edinburgh', 'Prince Harry Duke of Sussex').

% 2/ Is Prince Charles of Wales the grandfather of Prince George?
?- grandfather('Prince Charles of Wales', 'Prince George').

% 3/ Who is the grandfather of Princess Eugenie?
?- grandfather(X, 'Princess Eugenie').

% Test Set 14: grandmother
% 1/ Is HM Queen Elizabeth II the grandmother of Prince Louis?
?- grandmother('Hm Queen Elizabeth II', 'Prince Louis').

% 2/ Is Diana Princess of Wales the grandmother of Prince George?
?- grandmother('Diana Princess of Wales', 'Prince George').

% 3/ Who is the grandmother of Savannah?
?- grandmother(X, 'Savannah').

% Test Set 15: grandchild
% 1/ Is Prince George the grandchild of HM Queen Elizabeth II?
?- grandchild('Prince George', 'Hm Queen Elizabeth II').

% 2/ Is Archie Harrison the grandchild of Prince Charles of Wales?
?- grandchild('Archie Harrison', 'Prince Charles of Wales').

% 3/ Who is the grandchild of Philip Duke of Edinburgh?
?- grandchild(X, 'Philip Duke of Edinburgh').

% Test Set 16: grandson
% 1/ Is Prince Louis the grandson of HM Queen Elizabeth II?
?- grandson('Prince Louis', 'Hm Queen Elizabeth II').

% 2/ Is James Viscount Severn the grandson of Philip Duke of Edinburgh?
?- grandson('James Viscount Severn', 'Philip Duke of Edinburgh').

% 3/ Who is the grandson of Prince Charles of Wales?
?- grandson(X, 'Prince Charles of Wales').

% Test Set 17: granddaughter
% 1/ Is Princess Charlotte the granddaughter of HM Queen Elizabeth II?
?- granddaughter('Princess Charlotte', 'Hm Queen Elizabeth II').

% 2/ Is Lilibet Diana the granddaughter of Prince Charles of Wales?
?- granddaughter('Lilibet Diana', 'Prince Charles of Wales').

% 3/ Who is the granddaughter of Sarah Ferguson?
?- granddaughter(X, 'Sarah Ferguson').

% Test Set 18: sibling
% 1/ Is Prince William Duke of Cambridge the sibling of Prince Harry Duke of Sussex?
?- sibling('Prince William Duke of Cambridge', 'Prince Harry Duke of Sussex').

% 2/ Is Princess Beatrice the sibling of Princess Eugenie?
?- sibling('Princess Beatrice', 'Princess Eugenie').

% 3/ Who is the sibling of Prince Edward Earl of Wessex?
?- sibling(X, 'Prince Edward Earl of Wessex').

% Test Set 19: brother
% 1/ Is Prince Harry Duke of Sussex the brother of Prince William Duke of Cambridge?
?- brother('Prince Harry Duke of Sussex', 'Prince William Duke of Cambridge').

% 2/ Is Prince Andrew Duke of York the brother of Princess Anne?
?- brother('Prince Andrew Duke of York', 'Princess Anne').

% 3/ Who is the brother of Princess Eugenie?
?- brother(X, 'Princess Eugenie').

% Test Set 20: sister
% 1/ Is Princess Anne the sister of Prince Charles of Wales?
?- sister('Princess Anne', 'Prince Charles of Wales').

% 2/ Is Princess Beatrice the sister of Princess Eugenie?
?- sister('Princess Beatrice', 'Princess Eugenie').

% 3/ Who is the sister of Prince Edward Earl of Wessex?
?- sister(X, 'Prince Edward Earl of Wessex').

% Test Set 21: aunt
% 1/ Is Princess Anne the aunt of Prince William Duke of Cambridge?
?- aunt('Princess Anne', 'Prince William Duke of Cambridge').

% 2/ Is Sarah Ferguson the aunt of Lady Louise?
?- aunt('Sarah Ferguson', 'Lady Louise').

% 3/ Who is the aunt of Archie Harrison?
?- aunt(X, 'Archie Harrison').

% Test Set 22: uncle
% 1/ Is Prince Andrew Duke of York the uncle of Prince William Duke of Cambridge?
?- uncle('Prince Andrew Duke of York', 'Prince William Duke of Cambridge').

% 2/ Is Mark Phillips the uncle of Savannah?
?- uncle('Mark Phillips', 'Savannah').

% 3/ Who is the uncle of Princess Charlotte?
?- uncle(X, 'Princess Charlotte').

% Test Set 23: niece
% 1/ Is Princess Beatrice the niece of Princess Anne?
?- niece('Princess Beatrice', 'Princess Anne').

% 2/ Is Lady Louise the niece of Prince Charles of Wales?
?- niece('Lady Louise', 'Prince Charles of Wales').

% 3/ Who is the niece of Prince Edward Earl of Wessex?
?- niece(X, 'Prince Edward Earl of Wessex').

% Test Set 24: nephew
% 1/ Is Prince Harry Duke of Sussex the nephew of Princess Anne?
?- nephew('Prince Harry Duke of Sussex', 'Princess Anne').

% 2/ Is James Viscount Severn the nephew of Prince Andrew Duke of York?
?- nephew('James Viscount Severn', 'Prince Andrew Duke of York').

% 3/ Who is the nephew of Zara Tindall?
?- nephew(X, 'Zara Tindall').

% Test Set 25: divorced
% 1/ Is Prince Charles of Wales divorced from Diana Princess of Wales?
?- divorced('Prince Charles of Wales', 'Diana Princess of Wales').

% 2/ Is Prince Andrew Duke of York divorced from Sarah Ferguson?
?- divorced('Prince Andrew Duke of York', 'Sarah Ferguson').

% 3/ Who is divorced from Sophie Countess of Wessex?
?- divorced(X, 'Sophie Countess of Wessex').

% Test Set 26: married
% 1/ Is Prince Charles of Wales married to Camilla Duchess of Cornwall?
?- married('Prince Charles of Wales', 'Camilla Duchess of Cornwall').

% 2/ Is Prince William Duke of Cambridge married to X?
?- married('Prince William Duke of Cambridge', X).

% 3/ Who is married to Meghan Duchess of Sussex?
?- married(X, 'Meghan Duchess of Sussex').
