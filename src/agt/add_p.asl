+!process_add(LN, RN, ID) 
  <-  Sum = LN + RN;
      .print("Adder: computed ", LN, "+", RN, " = ", Sum);
      .send(alison, achieve, partial(ID, Sum)).