module generic_memory #(
  parameter type T = logic [31:0]
)(
  input logic clk,
  input logic [7:0] addr,
  input T write_data,
  input logic write_en,
  output T read_data
);
  T memory [256];
  
  always_ff @(posedge clk) begin
    if (write_en)
      memory[addr] <= write_data;
    read_data <= memory[addr];
  end
endmodule : generic_memory

module top;
  logic clk;
  logic [7:0] addr;
  logic [31:0] data32;
  logic [63:0] data64;
  logic write_en;
  
  generic_memory #(.T(logic [31:0])) mem32 (.*);
  generic_memory #(.T(logic [63:0])) mem64 (
    .clk(clk),
    .addr(addr),
    .write_data(data64),
    .write_en(write_en),
    .read_data(data64)
  );
endmodule : top
