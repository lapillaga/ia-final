padece(pedro,gripe).
padece(pedro,hepatitis).
padece(juan,hepatitis).
padece(maria,gripe).
padece(carlos,intoxicacion).

sintoma(fiebre,gripe).
sintoma(cansancio,hepatitis).
sintoma(diarrea,intoxicacion).
sintoma(cansancio,gripe).

suprime(aspirina,fiebre).
suprime(lomotil,diarrea).

% 1 2 Quien posee una enfermedad
dolencia(PERSONA,ENFERMEDAD):-padece(PERSONA,ENFERMEDAD).

% 3 4 5 Quien posee cierto sintoma
sintomas(PERSONA,SINTOMA):-dolencia(PERSONA,ENFERMEDAD),sintoma(SINTOMA,ENFERMEDAD).

% 6
alivia(FARMACO,ENFERMEDAD):-sintoma(SINTOMA,ENFERMEDAD),suprime(FARMACO,SINTOMA).
farmacoPersona(PERSONA, FARMACO):- padece(PERSONA, ENFERMEDAD),alivia(FARMACO, ENFERMEDAD).

% 7
comparteSintomas(PERSONA1, PERSONA2, SINTOMA):- sintomas(PERSONA1,SINTOMA),sintomas(PERSONA2,SINTOMA).