+!process_mult(LS, RS, ID)
  <-  Prod = LS * RS;
      .print("Multiplier: computed ", LS, "*", RS, " = ", Prod);
      .send(alison, achieve, partial(ID, Prod)).