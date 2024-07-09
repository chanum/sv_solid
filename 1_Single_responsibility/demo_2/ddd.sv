class PacketGenerator;
  function bit[7:0][] generate_packet(bit[7:0] data[], int packet_size);
    bit[7:0] packet[] = new[packet_size];
    int i;

    // Generar el paquete
    for (i = 0; i < data.size() && i < packet_size; i++) begin
      packet[i] = data[i];
    end

    // Rellenar el resto del paquete si es necesario
    for (; i < packet_size; i++) begin
      packet[i] = 8'h00;  // Padding
    end

    return packet;
  endfunction
endclass

class CRCCalculator;
  function bit[31:0] calculate_crc(bit[7:0] data[]);
    bit[31:0] crc = 32'hFFFFFFFF;

    foreach (data[i]) begin
      crc ^= data[i];
      for (int j = 0; j < 8; j++) begin
        if (crc & 32'h00000001)
          crc = (crc >> 1) ^ 32'hEDB88320;
        else
          crc = crc >> 1;
      end
    end

    return ~crc;
  endfunction
endclass

class PacketWithCRC;
  PacketGenerator pkt_gen;
  CRCCalculator crc_calc;

  function new();
    pkt_gen = new();
    crc_calc = new();
  endfunction

  function bit[7:0][] generate_packet_with_crc(bit[7:0] data[], int packet_size);
    bit[7:0] packet[] = pkt_gen.generate_packet(data, packet_size - 4);
    bit[31:0] crc = crc_calc.calculate_crc(packet);

    // Insertar CRC al final del paquete
    packet = {packet, crc[7:0], crc[15:8], crc[23:16], crc[31:24]};

    return packet;
  endfunction
endclass