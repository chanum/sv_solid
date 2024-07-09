module configurable_adder #(parameter N = 4) (
  input [N-1:0] a, b,
  output [N:0] sum
);
  generate
    if (N <= 4) begin : small_adder
      // Implementación para sumadores pequeños
    end else begin : large_adder
      // Implementación para sumadores grandes
    end
  endgenerate
endmodule