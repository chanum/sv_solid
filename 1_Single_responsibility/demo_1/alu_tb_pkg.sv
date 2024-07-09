
package alu_tb_pkg;

  // `include "alu_if.sv"
  
  typedef enum logic [1:0] {
    ADD = 2'b00,
    SUB = 2'b01,
    AND = 2'b10,
    OR  = 2'b11
  } alu_op_t;


  `include "alu_generator.svh"
  `include "alu_checker.svh"
  `include "alu_test.svh"
  
endpackage : alu_tb_pkg
