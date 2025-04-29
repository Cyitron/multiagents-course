
+!calcular: calcula(X) & .string(X) & .substring("*", X, A)
    <-  .print("Irei comecar a calcular uma multiplicacao!");
        .nth(A-1, X,F); // pega o primeiro numero da multiplicacao
        .nth(A+1, X,S); // pega o segundo numero da multiplicacao
        .nth(A, X, K);
        .print("a multiplicacao é ", F, " vezes ", S);
        .term2string(P,F);
        .term2string(D,S);  //.term2string(b,X): unifies X with "b".
                            //.term2string(X,"b"): unifies X with b.
        .print("As strings foram convertidas em numeros: ", P, ", ", D);
        R = P * D;
        .print("o resultado da multiplicacao é ", R);
        .term2string(R, T);
        .delete(A-1, A+2, X, N); // .delete("2*3","1+2*3",N): S unifies with "bnn".
        .print("Printa a exclusao da multiplicacao ", N);
        .concat(N,T,L); // .concat("a", "b", "c", "d", X): X unifies with "abcd".
        .print("nova string: ", L);
        -calcula(X);
        +calcula(L);
        !calcular.

+!calcular: calcula(X) & .string(X) & .substring("+", X, A)
    <-  .print("Irei comecar a calcular uma soma!");
        .nth(A-1, X,F); // pega o primeiro numero da multiplicacao
        .nth(A+1, X,S); // pega o segundo numero da multiplicacao
        .nth(A, X, K);
        .print("a soma é ", F, " mais ", S);
        .term2string(P,F);
        .term2string(D,S);  //.term2string(b,X): unifies X with "b".
                            //.term2string(X,"b"): unifies X with b.
        .print("As strings foram convertidas em numeros: ", P, ", ", D);
        R = P + D;
        .print("o resultado da soma é ", R);
        .term2string(R, T);
        .delete(A-1, A+2, X, N); // .delete("2*3","1+2*3",N): S unifies with "bnn".
        .print("Printa a exclusao da soma ", N);
        .concat(N,T,L); // .concat("a", "b", "c", "d", X): X unifies with "abcd".
        .print("nova string: ", L);
        -calcula(X);
        +calcula(L);
        !calcular.

+!calcular: calcula(X)
    <-  .print("não sobrou mais calculos para fazer.");
        .print("o resultado é: ", X).
