// abstract base class for math operations
virtual class math_operation;

  pure virtual function int execute(int a, int b);

endclass : math_operation

// concrete implementation addition
class addition extends math_operation;

  virtual function int execute(int a, int b);
    return a + b;
  endfunction

endclass : addition

//  concrete implementation multiplication
class multiplication extends math_operation;

  virtual function int execute(int a, int b);
    return a * b;
  endfunction

endclass : multiplication

// class that performs the math operations
class calculator;

  function int perform_operation(math_operation op, int x, int y);
    return op.execute(x, y);
  endfunction

endclass : calculator

// Example
module test;

  initial begin
    calculator calc = new();
    math_operation add = new addition();
    math_operation mult = new multiplication();

    $display("10 + 5 = %0d", calc.performOperation(add, 10, 5));
    $display("10 * 5 = %0d", calc.performOperation(mult, 10, 5));
  end

endmodule : test