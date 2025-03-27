posicao(le).
sujo(le).
sujo(ld).

!limpar_ambiente.

+!limpar_ambiente: ~sujo(X) & ~sujo(Y) & X\==Y
    <-
        .print("Encerrando minha tarefa.").


+!limpar_ambiente: posicao(X) & sujo(X)
    <-
        .print("Limpando ambiente na posicao ", X);
        !limpar(X);
        .wait(1000);
        !limpar_ambiente.
        
+!limpar_ambiente: posicao(X) & ~sujo(X)
    <-
        .print("Movendo-se de ", X);
        !mover;
        .wait(1000);
        !limpar_ambiente.



+!limpar(P)
    <-
        -sujo(P);
        +~sujo(P).

+!mover: posicao(le)
    <-
        -posicao(le);
        +posicao(ld).

+!mover: posicao(ld)
    <-
        -posicao(ld);
        +posicao(le).