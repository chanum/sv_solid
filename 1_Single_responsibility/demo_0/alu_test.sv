`include "alu_if.sv"

class alu_test;
  virtual alu_if vif;

  int num_tests;
  int num_errors;
  int coverage_add, coverage_sub, coverage_and, coverage_or;
  
  function new(virtual alu_if vif);
    this.vif = vif;
    num_tests = 0;
    num_errors = 0;
    coverage_add = 0;
    coverage_sub = 0;
    coverage_and = 0;
    coverage_or = 0;
  endfunction
  
  task run();
    vif.rst_n = 0;
    @(posedge vif.clk);
    vif.rst_n = 1;
    
    for (int i = 0; i < 1000; i++) begin
      vif.a = $random;
      vif.b = $random;
      vif.op = alu_op_t'($random % 4);
      
      @(posedge vif.clk);
      @(negedge vif.clk);
      
      case (vif.op)
        ADD: begin
          if (vif.result != vif.a + vif.b) begin
            $display("Error: ADD %0d + %0d = %0d, expected %0d", 
                     vif.a, vif.b, vif.result, vif.a + vif.b);
            num_errors++;
          end
          coverage_add++;
        end
        SUB: begin
          if (vif.result != vif.a - vif.b) begin
            $display("Error: SUB %0d - %0d = %0d, expected %0d", 
                     vif.a, vif.b, vif.result, vif.a - vif.b);
            num_errors++;
          end
          coverage_sub++;
        end
        AND: begin
          if (vif.result != (vif.a & vif.b)) begin
            $display("Error: AND %0d & %0d = %0d, expected %0d", 
                     vif.a, vif.b, vif.result, vif.a & vif.b);
            num_errors++;
          end
          coverage_and++;
        end
        OR: begin
          if (vif.result != (vif.a | vif.b)) begin
            $display("Error: OR %0d | %0d = %0d, expected %0d", 
                     vif.a, vif.b, vif.result, vif.a | vif.b);
            num_errors++;
          end
          coverage_or++;
        end
      endcase
      
      num_tests++;
    end
    
    $display("Test completed:");
    $display("Total tests: %0d", num_tests);
    $display("Total errors: %0d", num_errors);
    $display("Coverage:");
    $display("  ADD: %0d%%", (coverage_add * 100) / num_tests);
    $display("  SUB: %0d%%", (coverage_sub * 100) / num_tests);
    $display("  AND: %0d%%", (coverage_and * 100) / num_tests);
    $display("  OR:  %0d%%", (coverage_or * 100) / num_tests);
  endtask
endclass : alu_test