
!inicializar_camera.

+!inicializar_camera
  <- 	makeArtifact("camera_quarto","artifacts.Camera",[],D);
  	   	focus(D).
  	   	
+movimento 
  <-  !!verificar_pessoa.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!verificar_pessoa: pessoa_presente(P) & local(L)
 	<-  .print("Pessoa: ", P, " reconhecida no local ", L, " da casa.");
      .send(fechadura, tell, pessoa_presente(P));
      .send(fechadura, tell, local(L));
      .send(fechadura, achieve, chegada_pessoa(P,L)).

 +!hell_mode
  <- .broadcast(achieve, hell_mode_ativated).

 +!hell_mode_ativated
  <- .print("enviando imagens para as autoridades!").