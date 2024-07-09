virtual class memory;
  pure virtual function void write(bit [31:0] addr, bit [31:0] data);
  pure virtual function bit [31:0] read(bit [31:0] addr);
  pure virtual function void reset();
endclass : memory

class RAM extends memory;
  bit [31:0] mem [bit [31:0]];  // memory

  virtual function void write(bit [31:0] addr, bit [31:0] data);
    mem[addr] = data;
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    return mem[addr];
  endfunction
  
  virtual function void reset();
    mem.delete();
  endfunction
endclass : RAM

class ROM extends memory;
  bit [31:0] mem [bit [31:0]];  // memory read only

  virtual function void write(bit [31:0] addr, bit [31:0] data);
    // No op
  endfunction
  
  virtual function bit [31:0] read(bit [31:0] addr);
    return mem[addr];
  endfunction
  
  virtual function void reset();
    //No op
  endfunction
endclass : ROM

class TestBench;

  function void test_memory(Memory mem);
    mem.write(32'h1000, 32'hABCD1234);
    $display("Read: %h", mem.read(32'h1000));
    mem.reset();
  endfunction : test_memory

endclass : TestBench

