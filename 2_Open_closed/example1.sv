
interface bus_if;
  logic [31:0]  data;
  logic [3:0]   address;
  logic         read, write;
endinterface : bus_if

module memory(bus_if bus);
  // Implementación de memoria
endmodule : memory

module cache(bus_if bus);
  // Implementación de cache
endmodule : cache