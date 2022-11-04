`timescale 1ns / 1ps

/*
Design and verify a valid/ready based memory interface slave. 
The interface should be able to generate the ready output after a random delay. Memory should be 16x32 bits wide.
Valid/ready protocol must be honoured
*/

// A memory interface

/*
On the rising edge of valid_i / req_i, generate a random value using day_7 LFSR module.
Rising edge of valid_i / req_i is detected using day_3 module.
This is to generate the ready_o after a random delay. 
After random value is generated, it counts by 1 every positive clock cycle. 
As soon as the count reaches to 0, the ready_o is made logic 1 and data is written into memory if write s/g is high.
It reads from the memory when read s/g is valid.
*/

module day_17 (
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

  logic mem_rd;
  logic mem_wr;

  logic req_rising_edge;

  logic [3:0] lfsr_val;
  logic [3:0] count;

  assign mem_rd = req_i &  req_rnw_i;
  assign mem_wr = req_i & ~req_rnw_i;

  // Detect a rising edge on the req_i
  day_3 DAY3 (
    .clk            (clk),
    .reset          (reset),
    .a_i            (req_i),
    .rising_edge_o  (req_rising_edge),
    .falling_edge_o (/* Not needed */)
  );

  // Load a counter with random value on the rising edge
  logic[3:0] count_ff;
  logic[3:0] nxt_count;

  always_ff @(posedge clk or posedge reset)
    if (reset)
      count_ff <= 4'h0;
    else
      count_ff <= nxt_count;

  assign nxt_count = req_rising_edge ? lfsr_val:
                                       count_ff + 4'h1;

  assign count = count_ff;

  // Generate a random load value
  day_7 DAY7 (
    .clk            (clk),
    .reset          (reset),
    .lfsr_o         (lfsr_val)
  );

  // Write into the mem when the counter is 0
  always_ff @(posedge clk)
    if (mem_wr & ~|count)
      mem[req_addr_i] <= req_wdata_i;

  // Read directly
  assign req_rdata_o = mem[req_addr_i] & {32{mem_rd}};

  // Assert ready only when counter is at 0
  // This will add random delays on when memory gives the ready
  assign req_ready_o = ~|count;

endmodule