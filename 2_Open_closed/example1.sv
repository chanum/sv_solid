
interface bus_if;
  logic [31:0]  data;
  logic [3:0]   address;
  logic         read, write;
endinterface : bus_if

module memory(bus_if bus);
  // memory implementation
endmodule : memory

module cache(bus_if bus);
  // memory implementation
endmodule : cache
