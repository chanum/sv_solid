
import alu_pkg::*;

interface alu_if;
  logic        clk;
  logic        rst_n;
  logic [31:0] a;
  logic [31:0] b;
  logic [1:0]  op;
  logic [31:0] result;

  modport alu_ports (
    input  clk,
    input  rst_n,
    input  a,
    input  b,
    input  op,
    output result
  );

  modport tb_ports (
    output clk,
    output rst_n,
    output a,
    output b,
    output op,
    input  result
  );
endinterface