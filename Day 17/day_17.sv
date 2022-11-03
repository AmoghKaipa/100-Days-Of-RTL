`timescale 1ns / 1ps

/*
Design and verify a valid/ready based memory interface slave. 
The interface should be able to generate the ready output after a random delay. Memory should be 16x32 bits wide.
Valid/ready protocol must be honoured
*/


module day_17(
  input       wire        clk,
  input       wire        reset,
  input       wire        req_i,
  input       wire        req_rnw_i,    // 1 - read, 0 - write
  input       wire[3:0]   req_addr_i,
  input       wire[31:0]  req_wdata_i,
  output      wire        req_ready_o,
  output      wire[31:0]  req_rdata_o
);

// Memory array
`ifdef FORMAL
  logic [31:0] mem[15:0];
`else
  logic [15:0][31:0] mem;
`endif

logic r, w;
logic rising_edge;
logic[3:0] count_ff, next_count, count, lfsr_count;

day_3 Day_3(.clk(clk), .reset(reset), .d_in(req_i), .pos_edge(rising_edge), .pos_edge());

always_ff @(posedge clk or posedge reset) begin
    if(reset)
        count_ff <= 4'h0;
    else
        count_ff <= next_count;
end

day_7 Day_7(.clk(clk), .reset(reset), .lfsr_o(lfsr_count));

assign next_count = rising_edge? lfsr_count : count_ff+4'h1 ;

assign r = req_i & req_rnw_i;
assign w = req_i & ~req_rnw_i;
assign count = count_ff;

always_ff @(posedge clk) begin
    if(~|count & w)
    mem[req_addr_i] <=req_wdata_i;
end

assign req_rdata_o = mem[req_addr_i] & {32{r}};

// Assert ready only when count = 0. This is asserted after a random value.

assign req_ready_o = (~|count);



endmodule
