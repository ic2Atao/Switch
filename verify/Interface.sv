`ifndef INTERFACE_SV
`define INTERFACE_SV

interface mem_interface(input bit clock);
    parameter setup_time 5ns;
    parameter hold_time 3ns;

    wire mem_en;
    wire mem_rd_wr;
    wire [1:0] mem_add;
    wire [7:0] mem_data; 

    clocking cb@(posedge clock)
        default input setup_time output hold_time;
        output mem_en;
        output mem_rd_wr;
        output mem_add;
        output mem_data;
    endclocking

    modport MEM(clocking cb, input clock);
endinterface: mem_interface

interface input_interface(input bit clock);
    parameter setup_time 5ns;
    parameter hold_time 3ns;

    wire [7:0] data;
    wire       data_status;

    clocking cb@(posedge clock);
        output  data;
        output  data_status;
    endclocking

    modport IP(clocking cb, input clock);
endinterface:input_interface

interface output_interface(input bit clock);
    parameter setup_time 5ns;
    parameter hold_time 3ns;

    wire [7:0] port;
    wire       ready;
    wire       read;

    clocking cb@(posedge clock);
        input port;
        input ready;
        input read;
    endclocking

    modport OP(clocking cb, input clock);
endinterface:output_interface

`endif