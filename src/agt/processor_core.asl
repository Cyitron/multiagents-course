+!count_query
  <-  .count(calcula(_), N);
      .print("The numbers of query is: ", N);
      +query_number(N);
      +total_of_query(N);
      !ordenar.

+!ordenar : calcula(C)[id(Z)] & ordem(Y) & query_number(N) & N \== 0 & Z == 0
    <-  -calcula(C);
        +calcula(C)[id(Y)];
        .print("Expressao:", C, " of ID ", Y);
        P = Y + 1;
        -ordem(Y);
        +ordem(P);
        Q = N - 1;
        -query_number(N);
        +query_number(Q);
        !ordenar.

+!ordenar
  <-  !!calcular.

+!calcular : calcula(X)[id(Y)] & .string(X) & .substring("*", X, OpPos)
  <-  .nth(OpPos-1, X, LeftStr);    // pega o primeiro numero da multiplicacao
      .nth(OpPos+1, X, RightStr);   // pega o segundo numero da multiplicacao
      .nth(OpPos, X, K);
      .term2string(P, LeftStr);
      .term2string(D, RightStr);
      .print("Processor -> dispatching multiplication: ", P, "*", D, " of ID ", Y);
      .send(maria, achieve, process_mult(P, D, Y));
      .delete(OpPos-1, OpPos+2, X, N); // .delete("2*3","1+2*3",N):
      .print("Print multi exclusion ", N, " of ID ", Y);
      .print("New string: ", N, " of ID ", Y);
      -calcula(X)[id(Y)];
      +calcula(N)[id(Y)].

+!calcular : calcula(X)[id(Y)] & .string(X) & .substring("+", X, OpPos)
  <-  .nth(OpPos-1, X, LeftStr);    // pega o primeiro numero da multiplicacao
      .nth(OpPos+1, X, RightStr);   // pega o segundo numero da multiplicacao
      .nth(OpPos, X, K);
      .term2string(P, LeftStr);
      .term2string(D, RightStr);
      .print("Processor -> dispatching addition: ", P, "+", D, " of ID ", Y);
      .send(saphira, achieve, process_add(P, D, Y));
      .delete(OpPos-1, OpPos+2, X, N); // .delete("2*3","1+2*3",N):
      .print("Print add exclusion ", N, " of ID ", Y);
      .print("New string: ", N, " of ID ", Y);
      -calcula(X)[id(Y)];
      +calcula(N)[id(Y)].

+!processed(Result, ID) : calcula(X)[id(ID)]
  <-  .print("Processor -> received result: ", Result, " for ", ID);
      .term2string(Result, ResStr);
      .concat(X, ResStr, L); // .concat("a", "b", "c", "d", X): X unifies with "abcd".
      -calcula(X)[id(Y)];
      +calcula(L)[id(Y)];
      !!calcular.

+!calcular : calcula(X)[id(Y)] & total_of_query(N) & N == Y
  <-  .print("");
      .print("Processor: final result = ", X, " of ID: ", Y);
      Q = N - 1;
      -total_of_query(N);
      +total_of_query(Q);
      !calcular.

+!calcular
  <-  .print("");
      .print("Finish").