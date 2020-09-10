/*                                                        */
/**********************************************************/
 %% Sencillo sistema experto basado en reglas con encadenamiento
 %% hacia atrás. Dadas algunas posibles hipótesis él busca hacia
 %% atrás  para intentar  demostrar si es verdadera o no.  Si no
 %% puede probar el hecho usando las reglas, preguntará al usuario
 %% si es verdadero o no. Una vez que ha probado una  hipótesis,
 %% presenta sus conclusiones en pantalla.

 %% Juego de los Animales: el ordenador adivina tras una serie
 %% de preguntas en qué clase de animal estamos pensando.
 %% El programa controla el dialogo planteando una serie de preguntas
 %% sobre las características del animal a identificar, basadas
 %% en los datos que contiene en su base de conocimientos.
/*--  SISTEMA EXPERTO REALIZADO EN PROLOG  --*/
mensaje :- nl,write('Sistema Experto "Juego de los Animales" consultado.'),
           nl,nl,
           nl,write('Para ejecutarlo realiza la pregunta'),nl,
           nl,write('    ?- juego.'),
           nl,nl.


% -------------------------------------------------------------------
% DECLARACIÓN DE LOS OPERADORES

 :- op(1115, fx, si).
 :- op(1110, xfy, entonces).
 :- op(1100, xfy, o).
 :- op(1000, xfy, y).
 :- op(900, fx, no).
 :- dynamic hecho/2.
% -------------------------------------------------------------------
% SISTEMA EXPERTO: REGLAS Y HECHOS

% Regla  1: Si tiene pelo entonces es un mamífero
regla(si pelo(Animal) entonces mamifero(Animal)).

% Regla  2: Si amamanta a sus crías entonces es un mamífero
regla(si amamanta(Animal) entonces mamifero(Animal)).

% Regla  3: Si tiene plumas entonces es un ave
regla(si plumas(Animal) entonces ave(Animal)).

% Regla  4: Si vuela y pone huevos entonces es un ave
regla(si vuela(Animal) y poneHuevos(Animal) entonces ave(Animal)).

% Regla  5: Si come carne entonces es un carnívoro
regla(si comeCarne(Animal) entonces carnivoro(Animal)).

% Regla  6: Si tiene colmillos, garras y ojos al frente entonces es un carnívoro
regla(si colmillos(Animal) y garras(Animal) y ojosFrente(Animal)
     entonces carnivoro(Animal)).
regla(si mamifero(Animal) y  pezunas(Animal) entonces ungulado(Animal)).

% Regla  8: Si es un mamífero y rumia entonces es un ungulado
regla(si mamifero(Animal) y rumia(Animal) entonces ungulado(Animal)).

% Regla  9: Si es un mamífero, carnívoro, tiene color leonado y manchas oscuras entonces es un leopardo
regla(si mamifero(Animal) y carnivoro(Animal) y leonado(Animal) y
     manchasOscuras(Animal) entonces es(Animal,leopardo)).

% Regla 10: Si es un mamífero, carnívoro, tiene color leonado y rayas negras entonces es un tigre
regla(si mamifero(Animal) y carnivoro(Animal) y leonado(Animal) y
     rayasNegras(Animal) entonces es(Animal,tigre)).

% Regla 11: Si es un ungulado, tiene el cuello largo, patas largas y manchas oscuras entonces es una jirafa
regla(si ungulado(Animal) y cuelloLargo(Animal) y patasLargas(Animal)
     y manchasOscuras(Animal) entonces es(Animal,jirafa)).

% Regla 12: Si es un ungulado y tiene rayas negras entonces es una cebra
regla(si ungulado(Animal) y rayasNegras(Animal) entonces es(Animal,cebra)).

% Regla 13: Si es un ave que no vuela, tiene cuello largo, patas largas y es blanco y negro entonces es un avestruz
regla(si ave(Animal) y no vuela(Animal) y cuelloLargo(Animal) y
     patasLargas(Animal) y blancoYnegro(Animal) entonces es(Animal,avestruz)).

% Regla 14: Si es un ave que no vuela, nada y es blanco y negro entonces
% es up
regla(si ave(Animal) y no vuela(Animal) y nada(Animal) y
     blancoYnegro(Animal) entonces es(Animal,pinguino)).
% Regla 15: Si es un ave que vuela bien entonces es un albatros
regla(si ave(Animal) y vuela(Animal) y vuelaBien(Animal)
     entonces es(Animal,albatros)).

% animalesConocidos : animales que puede adivinar el sistema experto
animalesConocidos([leopardo,tigre,jirafa,cebra,avestruz,pinguino,albatros]).



% -------------------------------------------------------------------
% PLANTILLAS DE TEXTO (en castellano)

% ptext/2: Plantillas de texto para las preguntas
% (en castellano)
ptext(comeCarne(X), ['¿Come carne ',X,'? ']).
ptext(pelo(X), ['¿Tiene pelo ', X,'? ']).
ptext(amamanta(X), ['¿Amamanta a sus crías ', X, '? ']).
ptext(plumas(X), ['¿Tiene plumas ', X, '? ']).
ptext(vuela(X), ['¿Vuela ', X,'? ']).
ptext(vuelaBien(X), ['¿Pero vuela bien ', X,'? ']).
ptext(poneHuevos(X), ['¿Pone huevos ', X, '? ']).

ptext(colmillos(X), ['¿Tiene colmillos ',X,'? ']).
ptext(garras(X), ['¿Tiene garras ',X,'? ']).
ptext(ojosFrente(X), ['¿Tiene los ojos al frente ', X, '? ']).
ptext(pezunas(X), ['¿Tiene pezunas ',X,'? ']).
ptext(rumia(X), ['¿Rumia ',X,'? ']).
ptext(leonado(X), ['¿Tiene color leonado ',X,'? ']).
ptext(manchasOscuras(X), ['¿Tiene manchas oscuras ',X,'? ']).
ptext(rayasNegras(X), ['¿Tiene rayas negras ',X,'? ']).
ptext(cuelloLargo(X), ['¿Tiene el cuello largo ',X,'? ']).
ptext(patasLargas(X), ['¿Tiene las patas largas ',X,'? ']).
ptext(blancoYnegro(X), ['¿Es de color blanco y negro ',X,'? ']).
ptext(nada(X), ['¿Sabe nadar ',X,'? ']).


% rtexto/2: Texto de respuesta.
rtexto(es(Nombre,Animal), ['Me parece que ',Nombre,' es un ',Animal]).
% ------------------------------------------------------------------
% INICIO DEL EJEMPLO

juego :-
    write('Por favor introduce el nombre del animal'),nl,
    write('(letras minúsculas, finalizado en punto!) : '),
    leeAtomo(Nombre), nl,
    write(' Por favor, contesta a las preguntas con "s" o "n": '),nl,nl,
    animalesConocidos(L),
    compruebaHipotesis(Nombre,L).
% ------------------------------------------------------------------
% MOTOR DE INFERENCIA DEL SISTEMA EXPERTO

% compruebaHipotesis(Nombre,Hipotesis) <-
%   Tiene éxito cuando una de la hipótesis comprobadas es verdadera
%   o cuando las ha comprobado todas.

compruebaHipotesis(Nombre,Hipotesis) :-
      pertenece(Animal, Hipotesis),      % obtiene un animal como hipótesis
      esCierto(es(Nombre,Animal)), !,    % inicia encadenamiento hacia atrás
      rtexto(es(Nombre,Animal), Texto),  % da forma al texto de respuesta
      nl,escribeLista(Texto),            % escribe en pantalla
      nl,nl,write('Para borrar Base de Hechos: reinicializar.').

compruebaHipotesis(Nombre,_) :-
      escribeLista(['No he encontrado ningún animal en mi BC que se parezca a ',Nombre]),
      nl,nl,write('Para borrar Base de Hechos: reinicializar.').

% esCierto(+Hecho) <-
%   Tiene éxito si Hecho es verdadero, utilizando encadenamiento hacia atrás

esCierto(H1 y H2):- !,            %  H1 y H2 son ciertas si
    esCierto(H1),                 %  podemos probar H1
    esCierto(H2).                 %  y H2.

esCierto(H1 o H2):- !,            %  H1 o H2 son ciertas si
    esCierto(H1)                  %  podemos probar H1
    ;                             %  o
    esCierto(H2).                 %  podemos probar H2.

esCierto(Hecho) :-		     % Hecho es cierto si es un hecho!
    hecho(_,Hecho), !.
esCierto(Hecho) :-
    hecho(_, no Hecho), !, fail.  % Pero no lo es si su negación es verdadera.

esCierto(no Hecho) :-
    esCierto(Hecho), !, fail.     % Falla "no Hecho" si podemos probarlo,
esCierto(no _) :- !.              % en cualquier otro caso tiene éxito.

esCierto(Hecho):-                         % Hecho es verdadero si hay una
    regla(si Condiciones entonces Hecho), % regla con consecuente Hecho y
    esCierto(Condiciones).                % su antecedente puede ser probado.

esCierto(Hecho):-                 % Hecho es cierto si
    diceUsuario(Hecho).           % lo dice el usuario.
% diceUsuario(+Hecho) <-
%   Hecho es verdadero si al preguntárselo al usuario dice que "si".
diceUsuario(Hecho) :-
    ptext(Hecho, Pregunta),
    escribeLista(Pregunta),
    leeRespuesta(Respuesta),
    ((Respuesta = s ; Respuesta = 'S') ->
      assert(hecho(usuario, Hecho))
    ; assert(hecho(usuario, no Hecho)),
      fail
    ).
% ------------------------------------------------------------------
% Rutinas varias
pertenece(C, [C|_]).
pertenece(C, [_|Cola]) :- pertenece(C, Cola).

escribeLista([]).
escribeLista([C|Cola]) :- write(C), escribeLista(Cola).

leeAtomo(A) :- read(A), atom(A).
leeAtomo(A) :- write('Error: no es un átomo.'), nl, leeAtomo(A).

leeRespuesta(R) :- get_single_char(C), atom_char(R,C),
                   (R=s;R='S';R=n;R='N'),escribeRespuesta(R),!.
leeRespuesta(R) :- write('Error: "s" o "n".'),nl,leeRespuesta(R).

escribeRespuesta(R) :-
    (((R = s ; R = 'S') ->
          write('si'))
        ; write('no')
     ),nl.

reinicializar :-
	retractall(hecho(usuario, _)).


:- mensaje.
