
virtual class MemoryModel;
  pure virtual function void write(bit [31:0] addr, bit [31:0] data);
  pure virtual function bit [31:0] read(bit [31:0] addr);
endclass

class RAMModel extends MemoryModel;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // Implementación específica para RAM
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // Implementación específica para RAM
  endfunction
endclass

class CacheModel extends MemoryModel;
  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // Implementación específica para caché
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    // Implementación específica para caché
  endfunction
endclass

class TestBench;
  MemoryModel mem;
  
  function new(MemoryModel m);
    this.mem = m;
  endfunction
  
  task run();
    // Usar mem.read() y mem.write() sin conocer la implementación específica
  endtask
endclass