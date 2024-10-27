module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input logic clk, //clock
    input logic rst, //reset
    output logic [WIDTH-1:0] count //count output
);

always_ff @ (posedge clk)
    if (rst) count <= {WIDTH{1'b0}}; //if reset is high change all bits to 0
    else count <= count + {{WIDTH-1{1'b0}}, 1'b1};

endmodule
