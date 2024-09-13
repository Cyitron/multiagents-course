abertura_preferencia(Jonas, 50).

!inicializar_cortina.

+!inicializar_cortina
  <- 	makeArtifact("cortina_quarto","artifacts.Cortina",[],D);
  	   	focus(D).
  	   	//!abrir_cortina.
  	   	
+ajuste_cortina 
  <-  !!verificar_ajuste.
      
+closed  <-  .print("Close event from GUIInterface").
   
 +!verificar_ajuste: nivel_abertura(N) 
 	<-  .print("Nível de abertura da cortina: ", N).
 	
 +!abrir_cortina: nivel_abertura(N) 
 	<-  .print("Nível de abertura ANTES: ", N);
 		abrir;
 		?nivel_abertura(ND);
 		.print("Nível de abertura DEPOIS: ", ND).

 +!fechar_cortina: nivel_abertura(N) 
 	<-  .print("Nível de abertura ANTES: ", N);
 		fechar;
 		?nivel_abertura(ND);
 		.print("Nível de abertura DEPOIS: ", ND).

 +!fechar_cortina_ao_chegar: nivel_abertura(N) & abertura_preferencia(P,C) & C > N
 	<-  .print("Nível de abertura ANTES: ", N);
 		aumentar_nivel;
		?nivel_abertura(ND);
 		.print("Nível de abertura DEPOIS: ", ND);
		!fechar_cortina_ao_chegar.

 +!fechar_cortina_ao_chegar: nivel_abertura(N) & abertura_preferencia(P,C) & C < N
 	<-  .print("Nível de abertura ANTES: ", N);
 		diminuir_nivel;
		?nivel_abertura(ND);
 		.print("Nível de abertura DEPOIS: ", ND);
		!fechar_cortina_ao_chegar.


 +!fechar_cortina_ao_chegar: nivel_abertura(N) & abertura_preferencia(P,C) & C == N
 	<-  .print("Nível de abertura ANTES: ", N);
 		!verificar_ajuste;
		?nivel_abertura(ND);
 		.print("Nível de abertura DEPOIS: ", ND).

 +!hell_mode_ativated
	<- 	!fechar_cortina;
		.print("fechando cortinas").