`ifndef OUTPUT_INTF_SV
`define OUTPUT_INTF_SV

interface output_intf(input bit clock);
    parameter SETUP_TIME=2ns;
    parameter HOLD_TIME=1ns;

    wire [7:0] port0;
    wire [7:0] port1;
    wire [7:0] port2;
    wire [7:0] port3;
    wire ready_0;
    wire ready_1;
    wire ready_2;
    wire ready_3;
    wire read_0;
    wire read_1;
    wire read_2;
    wire read_3;

    clocking cb@(posedge clock);
    default input SETUP_TIME output HOLD_TIME
    input port0;
    input port1;
    input port2;
    input port3;
    input ready_0;
    input ready_1;
    input ready_2;
    input ready_3;
    input read_0;
    input read_1;
    input read_2;
    input read_3;
    endclocking:cb

    modport OUTPUT(clocking cb, input clock);
endinterface: output_intf

`endif