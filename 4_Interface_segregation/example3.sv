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
endinterface

module write_only_module(memory_if.writer mem);
  // Módulo que solo escribe en memoria
endmodule

module read_only_module(memory_if.reader mem);
  // Módulo que solo lee de memoria
endmodule

module memory_module(memory_if.memory mem);
  // Implementación de la memoria
endmodule