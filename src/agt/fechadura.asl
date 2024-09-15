!inicializar_fechadura.

pessoa_saindo :- fechada(false) & trancada(false).

+!inicializar_fechadura
  <- 	makeArtifact("fechadura_quarto","artifacts.Fechadura",[],D);
  	   	focus(D);
  	   	!fechar_porta.
  	   	
+movimento_macaneta <- !verificar_fechada.

+!chegada_pessoa("Jonas", "frente")
	<- .print("camera reconheceu o dono da casa chegando.");
		!abrir_porta;
		.send(ar_condicionado, achieve, climatizar);
		.send(lampada, achieve, ligar_lampada);
		.send(cortina, achieve, fechar_cortina_ao_chegar).

+!chegada_pessoa(P,L) : pessoa_presente(_) & local(_)
	<- !saida_pessoa(P,L).


+!saida_pessoa("Jonas", "sala") : trancada(false) & fechada(false)
	<- 	print("Jonas está saindo de casa.");
		.send(cortina, achieve, abrir_cortina);
		.send(lampada, achieve, desligar_lampada);
		.send(ar_condicionado, achieve, casa_vazia);
		.wait(10000);
		.send(fechadura, achieve, fechar_porta).

+!saida_pessoa("Jonas", "sala") : trancada(_) & fechada(_)
	<- .print("Jonas na sala, mas nao esta saindo de casa.").

+!saida_pessoa(P,L) : pessoa_presente(_) & local(_)
	<- .print("nao sei que pessoa é essa.");
		.send(camera, achieve, hell_mode);
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

+!hell_mode_ativated
	<- !!fechar_porta.
	