`ifndef INPUT_INTF_SV
`define INPUT_INTF_SV

interface input_intf(input bit clock);

    wire [7:0] data;
    wire data_status;

    parameter SETUP_TIME=2ns;
    parameter HOLD_TIME=1ns;

    clocking cb@(posedge clock);
    default input #SETUP_TIME output #HOLD_TIME;
    output  data;
    output data_status;
    endclocking:cb

    modport INPUT(clocking cb, input clock)

endinterface: input_intf

`endif  