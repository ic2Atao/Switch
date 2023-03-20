`include "uvm.svh"

module top;
    wire clock;

    initial begin
        clock = 0;
        #20;
        forever #10 clock = ~clock;
    end

    mem_interface mem_intf(clock);
    input_interface input_intf(clock);
    output_interface output_intf[4](clock);

    switch DUT(
        .clk(clock),
        .reset(input_intf.reset),
        .data_status(input_intf.IP.data_status),
        .data(input_intf.IP.data),
        .port0(output_intf[0].OP.port),
        .port1(output_intf[1].OP.port),
        .port2(output_intf[2].OP.port),
        .port3(output_intf[3].OP.port),
        .ready_0(output_intf[0].OP.ready),
        .ready_1(output_intf[1].OP.ready),
        .ready_2(output_intf[2].OP.ready),
        .ready_3(output_intf[3].OP.ready),
        .read_0(output_intf[0].OP.read),
        .read_1(output_intf[1].OP.read),
        .read_2(output_intf[2].OP.read),
        .read_3(output_intf[3].OP.read),
        .mem_en(mem_intf.MEM.mem_en),
        .mem_rd_wr(mem_intf.MEM.mem_rd_wr),
        .mem_add(mem_intf.MEM.mem_addr),
        .mem_data(mem_intf.MEM.mem_data)
    );

endmodule