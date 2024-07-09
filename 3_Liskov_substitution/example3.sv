class MemoryModel;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // Implementación base
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // Implementación base
  endfunction
endclass

class CacheMemoryModel extends MemoryModel;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // Implementación específica de caché
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // Implementación específica de caché
  endfunction
endclass

