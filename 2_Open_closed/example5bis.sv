
//  concrete implementation subtraction
class subtraction extends math_operation;

  virtual function int execute(int a, int b);
    return a - b;
  endfunction

endclass : subtraction

// then in the test module just add this for the new operation
math_operation sub = new subtraction();
$display("10 - 5 = %0d", calc.perform_operation(sub, 10, 5));

