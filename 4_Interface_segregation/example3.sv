interface memory_if;
  logic [31:0] address;
  logic [31:0] data;
  logic write_enable;
  logic read_enable;

  modport writer (
    output address, data, write_enable
  );

  modport reader (
    output address, read_enable,
    input data
  );

  modport memory (
    input address, data, write_enable, read_enable,
    output data
  );
endinterface : memory_if

module write_only_module(memory_if.writer mem);
  // module than only writes memory
endmodule

module read_only_module(memory_if.reader mem);
  // module than only reads memory
endmodule

module memory_module(memory_if.memory mem);
  // memory implementation
endmodule
