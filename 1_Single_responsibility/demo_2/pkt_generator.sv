class pkt_generator;
  function bit[7:0][] generate_packet_with_crc(bit[7:0] data[], int packet_size);
    bit[7:0] packet[];
    bit[31:0] crc;
    int i;

    // Generar el paquete
    packet = new[packet_size];
    for (i = 0; i < data.size() && i < packet_size - 4; i++) begin
      packet[i] = data[i];
    end

    // Rellenar el resto del paquete si es necesario
    for (; i < packet_size - 4; i++) begin
      packet[i] = 8'h00;  // Padding
    end

    // Calcular CRC
    crc = 32'hFFFFFFFF;
    for (i = 0; i < packet_size - 4; i++) begin
      crc ^= packet[i];
      for (int j = 0; j < 8; j++) begin
        if (crc & 32'h00000001)
          crc = (crc >> 1) ^ 32'hEDB88320;
        else
          crc = crc >> 1;
      end
    end
    crc = ~crc;

    // Insertar CRC al final del paquete
    packet[packet_size-4] = crc[7:0];
    packet[packet_size-3] = crc[15:8];
    packet[packet_size-2] = crc[23:16];
    packet[packet_size-1] = crc[31:24];

    return packet;
  endfunction
endclass : pkt_generator