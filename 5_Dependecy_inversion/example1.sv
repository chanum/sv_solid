
interface bus_if;
  logic [31:0] data;
  logic [3:0] address;
  logic read, write;
endinterface

module memory_controller(bus_if.master bus);
  // Implementación del controlador de memoria
endmodule

module ram(bus_if.slave bus);
  // Implementación de la RAM
endmodule

module cache(bus_if.slave bus);
  // Implementación de la caché
endmodule

module top;
  bus_if bus();
  memory_controller mc(bus);
  ram ram_inst(bus);
  // O alternativamente:
  // cache cache_inst(bus);
endmodule