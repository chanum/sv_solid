// En lugar de una interfaz grande y general
interface big_memory_if;
  logic [31:0] address;
  logic [31:0] write_data;
  logic [31:0] read_data;
  logic write_enable;
  logic read_enable;
  logic reset;
  logic clock;
endinterface

// Podemos segregar en interfaces más específicas
interface memory_write_if;
  logic [31:0] address;
  logic [31:0] write_data;
  logic write_enable;
endinterface

interface memory_read_if;
  logic [31:0] address;
  logic [31:0] read_data;
  logic read_enable;
endinterface

interface clock_if;
  logic clock;
  logic reset;
endinterface

// Uso de las interfaces segregadas
module memory_controller(
  memory_write_if.slave write_if,
  memory_read_if.slave read_if,
  clock_if.slave clk_if
);
  // Implementación del controlador
endmodule

module ram(
  memory_write_if.slave write_if,
  memory_read_if.slave read_if,
  clock_if.slave clk_if
);
  // Implementación de la RAM
endmodule