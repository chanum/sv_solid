// class alu_test;
//   // Interfaz virtual para conectar con el DUT
//   virtual alu_if vif;
  
//   // Constructor
//   function new(virtual alu_if vif);
//     this.vif = vif;
//   endfunction
  
//   // Tarea que hace todo
//   task run();
//     // Generación de estímulos
//     for (int i = 0; i < 100; i++) begin
//       vif.a = $random;
//       vif.b = $random;
//       vif.op = alu_op_t'($random % 4);
//       @(posedge vif.clk);
//     end
    
//     // Comprobación de resultados
//     for (int i = 0; i < 100; i++) begin
//       case (vif.op)
//         ADD: assert(vif.result == vif.a + vif.b);
//         SUB: assert(vif.result == vif.a - vif.b);
//         AND: assert(vif.result == vif.a & vif.b);
//         OR:  assert(vif.result == vif.a | vif.b);
//       endcase
//     end
    
//     // Reporte de cobertura
//     $display("Cobertura de operaciones:");
//     $display("ADD: %0d%%", $get_coverage(vif.op == ADD));
//     $display("SUB: %0d%%", $get_coverage(vif.op == SUB));
//     $display("AND: %0d%%", $get_coverage(vif.op == AND));
//     $display("OR: %0d%%", $get_coverage(vif.op == OR));
//   endtask
// endclass : alu_test

// `include "alu_if.sv"
import alu_tb_pkg::*;

class alu_test;
  virtual alu_if vif;
  alu_generator stimulus;
  alu_checker achecker;
  
  function new(virtual alu_if vif);
    this.vif = vif;
    stimulus = new(vif);
    achecker = new(vif);
  endfunction
  
  task run();
    fork
      stimulus.generate_stimulus();
      achecker.check_results();
    join
  endtask
endclass : alu_test
