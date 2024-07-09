
module alu #(parameter DATA_WIDTH = 32)
  (
    input  logic                  clk,
    input  logic                  rst_n,
    input  logic [DATA_WIDTH-1:0] a_i,
    input  logic [DATA_WIDTH-1:0] b_i,
    input   logic [1:0]           op_i,
    output logic [DATA_WIDTH-1:0] result_o
  );

  logic [DATA_WIDTH-1:0] result_reg;

  always_comb begin
    case (op_i)
      2'b00: result_reg = a_i + b_i; // ADD
      2'b01: result_reg = a_i - b_i; // SUB
      2'b10: result_reg = a_i & b_i; // AND
      2'b11:  result_reg = a_i | b_i; // OR
      default: result_reg = '0;
    endcase
  end

  always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      result_o <= '0;
    end else begin
      result_o <= result_reg;
    end
  end

endmodule: alu