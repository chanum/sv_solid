// Clase para generación de estímulos"

import alu_tb_pkg::*;

class alu_generator;
  virtual alu_if vif;
  
  function new(virtual alu_if vif);
    this.vif = vif;
  endfunction
  
  task generate_stimulus();
    for (int i = 0; i < 100; i++) begin
      vif.a = $random;
      vif.b = $random;
      vif.op = alu_op_t'($random % 4);
      @(posedge vif.clk);
    end
  endtask
endclass : alu_generator
