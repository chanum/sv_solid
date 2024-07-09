class Subtraction extends MathOperation;
  virtual function int execute(int a, int b);
    return a - b;
  endfunction
endclass

// En el módulo de prueba
MathOperation sub = new Subtraction();
$display("10 - 5 = %0d", calc.performOperation(sub, 10, 5));

