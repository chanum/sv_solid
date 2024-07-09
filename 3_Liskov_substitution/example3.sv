class memory_model;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // base implementation
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // base implementation
  endfunction
endclass : memory_model

class cache_memory_model extends memory_model;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // specific implementation of write
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
     // specific implementation of read
  endfunction
endclass : cache_memory_model

