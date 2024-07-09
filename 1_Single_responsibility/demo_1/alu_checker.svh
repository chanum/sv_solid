

import alu_tb_pkg::*;

class alu_checker;
  virtual alu_if vif;
  
  function new(virtual alu_if vif);
    this.vif = vif;
  endfunction
  
  task check_results();
    // for (int i = 0; i < 100; i++) begin
    wait (vif.rst_n == 1'b1);
    forever begin
      @(posedge vif.clk);
      case (alu_op_t'(vif.op))
        ADD: assert(vif.result == vif.a + vif.b);
        SUB: assert(vif.result == vif.a - vif.b);
        AND: assert(vif.result == vif.a & vif.b);
        OR:  assert(vif.result == vif.a | vif.b);
      endcase
    end
      // @(posedge vif.clk);
    // end
  endtask
endclass : alu_checker
