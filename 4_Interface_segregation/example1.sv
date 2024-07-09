// general and big interface
interface big_memory_if;
  logic [31:0] address;
  logic [31:0] write_data;
  logic [31:0] read_data;
  logic write_enable;
  logic read_enable;
  logic reset;
  logic clock;
endinterface : big_memory_if

------

// small and specific interfaces
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

// use of segregated interfaces
module memory_controller (
  memory_write_if.slave write_if,
  memory_read_if.slave read_if,
  clock_if.slave clk_if
);
  // controller implementation 
endmodule

module ram (
  memory_write_if.slave write_if,
  memory_read_if.slave read_if,
  clock_if.slave clk_if
);
  // ram implementation
endmodule
