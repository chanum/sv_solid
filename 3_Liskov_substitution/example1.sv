class Transaction;
  bit [31:0] address;
  bit [31:0] data;
  
  virtual function void display();
    $display("Address: %0h, Data: %0h", address, data);
  endfunction
endclass

class ReadTransaction extends Transaction;
  bit read_type;
  
  virtual function void display();
    super.display();
    $display("Read Type: %0b", read_type);
  endfunction
endclass

class WriteTransaction extends Transaction;
  bit write_enable;
  
  virtual function void display();
    super.display();
    $display("Write Enable: %0b", write_enable);
  endfunction
endclass