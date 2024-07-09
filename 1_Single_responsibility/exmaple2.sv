class packet_assembler;
  function bit[7:0][] assemble_packet(bit[7:0] data[], bit[31:0] crc);
    bit[7:0] packet[] = new[data.size() + 4];
    packet[0:data.size()-1] = data;
    packet[data.size():data.size()+3] = crc[7:0], crc[15:8], crc[23:16], crc[31:24];
    return packet;
  endfunction : assemble_packet
endclass : packet_assembler

class CRC_calculator;
  function bit[31:0] calculate_crc(bit[7:0] data[]);
    bit[31:0] crc = 32'hFFFFFFFF;
    foreach (data[i]) begin
      crc ^= data[i];
      repeat(8) crc = (crc >> 1) ^ (crc[0] ? 32'hEDB88320 : 0);
    end
    return ~crc;
  endfunction
endclass : CRC_calculator

class packet_generator;
  packet_assembler assembler;
  CRC_calculator crc_calc;

  function new();
    assembler = new();
    crc_calc = new();
  endfunction

  function bit[7:0][] generate_packet_with_crc(bit[7:0] data[]);
    bit[31:0] crc = crc_calc.calculate_crc(data);
    return assembler.assemble_packet(data, crc);
  endfunction
endclass : packet_generator
