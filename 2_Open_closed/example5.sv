// Clase abstracta base para operaciones matemáticas
virtual class MathOperation;
  pure virtual function int execute(int a, int b);
endclass

// Implementación concreta para suma
class Addition extends MathOperation;
  virtual function int execute(int a, int b);
    return a + b;
  endfunction
endclass

// Implementación concreta para multiplicación
class Multiplication extends MathOperation;
  virtual function int execute(int a, int b);
    return a * b;
  endfunction
endclass

// Clase que utiliza las operaciones matemáticas
class Calculator;
  function int performOperation(MathOperation op, int x, int y);
    return op.execute(x, y);
  endfunction
endclass

// Ejemplo de uso
module test;
  initial begin
    Calculator calc = new();
    MathOperation add = new Addition();
    MathOperation mult = new Multiplication();

    $display("10 + 5 = %0d", calc.performOperation(add, 10, 5));
    $display("10 * 5 = %0d", calc.performOperation(mult, 10, 5));
  end
endmodule