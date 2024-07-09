interface memory_if;
  logic [31:0] address;
  logic [31:0] data;
  logic read, write;
  
  modport master (output address, data, read, write);
  modport slave (input address, data, read, write);
endinterface

module base_memory(memory_if.slave mem);
  // Implementación básica de memoria
endmodule

module cache_memory(memory_if.slave mem);
  // Implementación de memoria caché
endmodule

