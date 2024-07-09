class transaction;
  bit [31:0] address;
  bit [31:0] data;
  
  virtual function void display();
    $display("Address: %0h, Data: %0h", address, data);
  endfunction
endclass : transaction

class read_transaction extends transaction;
  bit read_type;
  
  virtual function void display();
    super.display();
    $display("Read Type: %0b", read_type);
  endfunction
endclass : read_transaction

class wite_transaction extends transaction;
  bit write_enable;
  
  virtual function void display();
    super.display();
    $display("Write Enable: %0b", write_enable);
  endfunction
endclass : wite_transaction

