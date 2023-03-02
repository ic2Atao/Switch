`ifndef MEM_INTF_SV
`define MEM_INTF_SV

interface mem_intr(input bit clock);

    parameter SETUP_TIME = 2ns;
    parameter HOLD_TIME = 1ns;

    wire mem_en;
    wire mem_rd_wr;
    wire [1:0] mem_addr;
    wire [7:0] mem_data;

    clocking cb@(posedge clock);
    default input #SETUP_TIME output #HOLD_TIME;
    output mem_en;
    output mem_rd_wr;
    output mem_addr;
    output mem_data;
    endclocking:cb

    modport MEM (clocking cb,input clock);

endinterface //mem_intr

`endif macro