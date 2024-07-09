`timescale 1ns/1ps


import alu_tb_pkg::*;

module tb_top;
  logic clk;
  logic rst_n;

  // Clock generation
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  alu_if alu_interface();

  alu dut (
    .clk(alu_interface.clk),
    .rst_n(alu_interface.rst_n),
    .a_i(alu_interface.a),
    .b_i(alu_interface.b),
    .op_i(alu_interface.op),
    .result_o(alu_interface.result)
  );


  assign alu_interface.clk = clk;
  assign alu_interface.rst_n = rst_n;

  alu_test test;

  initial begin
    rst_n = 0;
    test = new(alu_interface);

    // Reset genaration
    #20 rst_n = 1;

    // Run test
    test.run();

    #100 $finish;
  end

//   initial begin
//     $dumpfile("alu_test.vcd");
//     $dumpvars(0, tb_top);
//   end
endmodule : tb_top