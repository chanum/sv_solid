class packet_generator;

  function bit[7:0][] gen_pkt_with_crc (bit[7:0] data[]);
    bit[7:0] packet[] = new[data.size() + 4]; // +4 for hcrc
    bit[31:0] crc = 32'hFFFFFFFF;

    // copy data and calc crc
    foreach (data[i]) begin
      packet[i] = data[i];
      crc ^= data[i];
      repeat(8) crc = (crc >> 1) ^ (crc[0] ? 32'hEDB88320 : 0);
    end
    crc = ~crc;

    // add crc at the end of the pkt
    packet[data.size():data.size()+3] = crc[7:0], crc[15:8], crc[23:16], crc[31:24];

    return packet;
  endfunction : gen_pkt_with_crc

endclass : packet_generator
