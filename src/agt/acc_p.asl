+!partial(ID, Value)
  <-  .print("Accumulator: received partial result ", Value, " for ", ID);
      .send(peter, achieve, processed(Value, ID)).