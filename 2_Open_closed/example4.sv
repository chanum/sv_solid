module configurable_adder #(parameter N = 4) (
  input [N-1:0] a, b,
  output [N:0] sum
);

  generate : gen_adders
    if (N <= 4) begin : small_adder
      // implementation small addres
    end 
    else begin : large_adder
       // implementation large addres
    end
  endgenerate

endmodule : configurable_adder