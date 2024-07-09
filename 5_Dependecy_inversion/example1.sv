
interface bus_if;
  logic [31:0] data;
  logic [3:0] address;
  logic read, write;
endinterface : bus_if

module memory_controller(bus_if.master bus);
  // implementation of memory controller
endmodule

module ram(bus_if.slave bus);
  // implementation of ram
endmodule

module cache(bus_if.slave bus);
  // implementation of cache
endmodule

module top;
  bus_if bus();
  memory_controller mc(bus);
  ram ram_inst(bus);
endmodule
