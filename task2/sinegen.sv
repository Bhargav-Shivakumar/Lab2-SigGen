module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    // interface signals
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic [D_WIDTH-1:0]   incr,
    input logic [D_WIDTH-1:0]   phase_offset,
    output logic [D_WIDTH-1:0]  dout1,
    output logic [D_WIDTH-1:0]  dout2,
);

logic [A_WIDTH-1:0] address1;
logic [A_WIDTH-1:0] address2;

counter addrCounter(
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address1)
);

assign address2 = address1 + phase_offset;

rom sineRom(
    .clk (clk),
    .addr1 (address1),
    .addr2 (address2),
    .dout1 (dout1),
    .dout2 (dout2),
    .phase_offset (phase_offset)


);

endmodule