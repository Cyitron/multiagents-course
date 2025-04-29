
+!cumprimentar: sei_falar(portugues)
    <-  .print("Olá");
        .broadcast(achieve, cumprimentar).

+!cumprimentar: sei_falar(ingles)
    <-  .print("Hello");
        .send(portugues, tell, saudacao("Hello")).

+!cumprimentar: sei_falar(espanhol)
    <-  .print("Hola");
        .send(portugues, tell, saudacao("Hola")).

+!cumprimentar: sei_falar(alemao)
    <-  .print("Hallo");
        .send(portugues, tell, saudacao("Hallo")).

+!cumprimentar: sei_falar(italiano)
    <-  .print("Ciao");
        .send(portugues, tell, saudacao("Ciao")).

+!aprenda: sei_falar(portugues) & saudacao("Hello")
    <-  .print("estou mandando o ingles aprender a falar portugues");
        .send(ingles, achieve, learn(portugues)).

+!aprenda
    <- !aprenda.

+!learn(portugues): sei_falar(ingles)
    <-  .print("Agora eu sei falar portugues também!");
        +sei_falar(portugues);
        .print("Olá");
        .send(portugues, tell, saudacao("Olá")).