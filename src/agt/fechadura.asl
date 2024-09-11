!inicializar_fechadura.

pessoa_saindo :- fechada(false) & trancada(false).

+!inicializar_fechadura
  <- 	makeArtifact("fechadura_quarto","artifacts.Fechadura",[],D);
  	   	focus(D);
  	   	!fechar_porta.
  	   	
+movimento_macaneta <- !verificar_fechada.

+!chegada_pessoa : pessoa_presente("Jonas") & local("frente")
	<- .print("camera reconheceu o dono da casa chegando.");
		!abrir_porta;
		.send(ar_condicionado, achieve, climatizar);
		.send(lampada, achieve, ligar_lampada);
		.send(cortina, achieve, fechar_cortina).

+!chegada_pessoa : pessoa_presente(_) & local(_)
	<- !saida_pessoa.


+!saida_pessoa : pessoa_presente("Jonas") & local("sala") & pessoa_saindo
	<- 	.send(cortina, achive, abrir_cortina);
		.send(lampada, achive, desligar_lampada).

+!saida_pessoa : pessoa_presente(_) & local(_)
	<- .print("nao sei que pessoa é essa.");
		!trancar_porta;
		.print("enviando alerta para a policia!").

+!verificar_fechada: trancada(true) 
  <-  .print("Alguém mexeu na MAÇANETA, porém a porta está trancada!").
+!verificar_fechada: fechada(true)
  <-  .print("Alguém mexeu na MAÇANETA e FECHOU a porta!").
+!verificar_fechada: fechada(false)
  <-  .print("Alguém mexeu na MAÇANETA e ABRIU a porta!").
  
+movimento_fechadura <- !verificar_trancada.

+!verificar_trancada: trancada(true)
  <-  .print("Alguém mexeu na FECHADURA e TRANCOU a porta!").
+!verificar_trancada: trancada(false)
  <-  .print("Alguém mexeu na FECHADURA e DESTRANCOU a porta!").
      
+closed <- .print("Close event from GUIInterface").
   
+!fechar_porta: fechada(true)
 	<-  .print("Porta Fechada!");
 		!trancar_porta.
 	
+!fechar_porta: fechada(false)
 	<-  fechar;
 		.print("FECHEI a porta");
 		!fechar_porta.
 		
+!trancar_porta: trancada(true)
 	<- .print("Porta Trancada!").
 	
+!trancar_porta: trancada(false)
 	<- 	trancar;
 		.print("TRANQUEI a porta!");
 		!trancar_porta.
	
+!abrir_porta: fechada(true) & trancada(true)
	<-	destrancar;
		.print("destranquei a porta");
		!abrir_porta.

+!abrir_porta: fechada(true) & trancada(false)
	<-	fechar;
		.print("porta aberta");
		!fechar_porta.