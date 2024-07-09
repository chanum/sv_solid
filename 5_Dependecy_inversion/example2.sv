
virtual class memory_model;
  pure virtual function void write(bit [31:0] addr, bit [31:0] data);
  pure virtual function bit [31:0] read(bit [31:0] addr);
endclass : memory_model

class ram_model extends memory_model;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // write implementation for cache RAM
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // read implementation for RAM
  endfunction
endclass : ram_model

class cache_model extends memory_model;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // write implementation for cache
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // read implementation for cache
  endfunction
endclass : cache_model

class TestBench;
  memory_model mem;
  
  function new(memory_model m);
    this.mem = m;
  endfunction
  
  task run();
    // we can use mem.read() or mem.write() without known the specific implementation
  endtask
endclass : TestBench
