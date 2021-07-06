%Arvore genealogica familia Alejandro
%Trabalho controle de frequencia CLP
progenitor(marly,romer).
progenitor(urbano,romer).
progenitor(marly,vera).
progenitor(urbano,vera).
progenitor(marly,alessandra).
progenitor(urbano,alessandra).
progenitor(ondina,daniel).
progenitor(mario,daniel).
progenitor(romer,yuri).
progenitor(vani,yuri).
progenitor(romer,uryel).
progenitor(vani,uryel).
progenitor(romer,yadja).
progenitor(vani,yadja).
progenitor(romer,yanka).
progenitor(vani,yanka).
progenitor(vera,lucas).
progenitor(charles,lucas).
progenitor(alessandra,nauana).
progenitor(daniel,nauana).
progenitor(alessandra,alejandro).
progenitor(daniel,alejandro).
progenitor(nauana,paolla).
progenitor(alex,paolla).

sexo(marly,feminino).
sexo(ondina,feminino).
sexo(vera,feminino).
sexo(alessandra,feminino).
sexo(vani,feminino).
sexo(yadja,feminino).
sexo(yanka,feminino).
sexo(nauana,feminino).
sexo(paolla,feminino).

sexo(urbano,masculino).
sexo(mario,masculino).
sexo(romer,masculino).
sexo(charles,masculino).
sexo(daniel,masculino).
sexo(lucas,masculino).
sexo(alejandro,masculino).
sexo(yuri,masculino).
sexo(uryel,masculino).
sexo(alex,masculino).

avo(X,Y):- progenitor(X,A),progenitor(A,Y),sexo(X,masculino).
avoh(X,Y):- progenitor(X,A),progenitor(A,Y),sexo(X,feminino).

mae(X,Y):- progenitor(X,Y),sexo(X,feminino).
pai(X,Y):- progenitor(X,Y),sexo(X,masculino).

irma(X,Y):-progenitor(A,X),progenitor(A,Y),X\==Y,sexo(X,feminino).
irmao(X,Y):-progenitor(A,X),progenitor(A,Y),X\==Y,sexo(X,masculino).

tia(X,Y):- irmao(X,A),progenitor(A,Y),sexo(X,feminino).
tio(X,Y):- irmao(X,A),progenitor(A,Y),sexo(X,masculino).

prima(X,Y):-irmao(A,B),progenitor(A,X),progenitor(B,Y),X\==Y,sexo(X,feminino).
prima(X,Y):-irma(A,B),progenitor(A,X),progenitor(B,Y),X\==Y,sexo(X,feminino).
primo(X,Y):-irmao(A,B),progenitor(A,X),progenitor(B,Y),X\==Y,sexo(X,masculino).
primo(X,Y):-irma(A,B),progenitor(A,X),progenitor(B,Y),X\==Y,sexo(X,masculino).

sobrinha(X,Y):- irmao(Y,A),progenitor(A,X),sexo(X,feminino).
sobrinha(X,Y):- irma(Y,A),progenitor(A,X),sexo(X,feminino).
sobrinho(X,Y):- irmao(Y,A),progenitor(A,X),sexo(X,masculino).
sobrinho(X,Y):- irma(Y,A),progenitor(A,X),sexo(X,masculino).

descendente(X,Y):- progenitor(Y,X).
descendente(X,Y):- progenitor(Y,A),descendente(X,A).