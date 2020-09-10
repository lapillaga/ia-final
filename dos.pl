rufian(bertoldo).
rufian(bartolo).
noble(romeo).
noble(bertoldo).
plebeyo(bartolo).
dama(gertrudis).
dama(julieta).
hermosa(julieta).
desea(S,X):-
 plebeyo(S)->
 (dama(X));
 noble(S)->
 (dama(X), hermosa(X)).

rapta(S,X):-
 rufian(S),
 desea(S,X).