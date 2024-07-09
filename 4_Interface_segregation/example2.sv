virtual class WritableMemory;
  pure virtual function void write(bit [31:0] addr, bit [31:0] data);
endclass

virtual class ReadableMemory;
  pure virtual function bit [31:0] read(bit [31:0] addr);
endclass

virtual class ResetableMemory;
  pure virtual function void reset();
endclass

class RAM extends WritableMemory, ReadableMemory, ResetableMemory;
  // Implementación completa
endclass

class ROM extends ReadableMemory;
  // Implementación solo de lectura
endclass

class TestBench;
  function void test_write(WritableMemory mem);
    // Prueba de escritura
  endfunction
  
  function void test_read(ReadableMemory mem);
    // Prueba de lectura
  endfunction
  
  function void test_reset(ResetableMemory mem);
    // Prueba de reset
  endfunction
endclass