
package alu_pkg;
  
  typedef enum logic [1:0] {
    ADD = 2'b00,
    SUB = 2'b01,
    AND = 2'b10,
    OR  = 2'b11
  } alu_op_t;

endpackage : alu_pkg