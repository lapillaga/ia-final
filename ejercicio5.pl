animal(robbie).
animal(suzie).
tiene(robbie, manchasOscuras).
tiene(suzie, plumas).
come(robbie, carne).
vuela(suzie).
vuelaBien(suzie).
mamifero(X) :- animal(X), tiene(X, pelo), da(X, leche).
ave(X) :- animal(X), tiene(X, plumas).
ave(X) :- vuela(X), pone(X, huevos).
carnivoro(X) :- animal(X), come(X, carne).
carnivoro(X) :- animal(X), come(X, carne), tiene(X, dientes_puntiagudos), tiene(X,garras), tiene(X, ojosAlFrente).
ungulado(X) :- animal(X), mamifero(X), tiene(X, pezunas).
ungulado(X):- animal(X),rumia(X).
leopardo(X) :- animal(X), mamifero(X), carnivoro(X), tiene(X,  colorLeonado), tiene(X, manchas_oscuras).
tigre(X) :- animal(X), mamifero(X), carnivoro(X), tiene(X,  colorLeonado), tiene(X, rayas_negras).
jirafa(X) :- animal(X),ungulado(X), tiene(X, cuello_largo), tiene(X, patas_largas), tiene(X, manchas_oscuras).
cebra(X) :- animal(X), ungulado(X), tiene(X, rayas_negras).
avestruz(X) :- animal(X), ave(X), not(vuela(X)), tiene(X, cuello_largo), tiene(X, patas_largas),  color(X, blanco), color(X, negro).
pinguino(X) :- animal(X), ave(X), not(vuela(X)), nada(X), color(X, blanco), color(X, negro).
albatros(X) :- animal(X), ave(X),  vuelaBien(X).
especie(Z,Y):- animal(X), padre(X,Z),especie(X,Y).