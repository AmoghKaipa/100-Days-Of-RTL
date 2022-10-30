`timescale 1ns / 1ps

//Design and verify a 4-bit round robin arbiter.

/*
About Arbiter:
An Arbiter provides or grants access to the Resource when there are multiple requests. It can be of 2 types:
1. Priority Arbiter
2. Round Robin Arbiter
Priority Arbiter grants access of the resource to the request having the highest priority.
Round Robin Arbiter grants access of the resource to all the requests in a cyclic fashion unless priority arbiter. 
*/


// TB for round robin

module day15_tb ();

  logic         clk;
  logic         reset;

  logic [3:0]   req_i;
  logic [3:0]   gnt_o;

  // Instatiate the module
  day15 DAY15 (.*);

  // Clock
  always begin
    clk = 1'b1;
    #5;
    clk = 1'b0;
    #5;
  end

  // Stimulus
  initial begin
    reset <= 1'b1;
    req_i <= 4'h0;
    @(posedge clk);
    reset <= 1'b0;
    @(posedge clk);
    @(posedge clk);
    for (int i =0; i<32; i++) begin
      req_i <= $urandom_range(0, 4'hF);
      @(posedge clk);
    end
    $finish();
  end

  // VCD dump
  initial begin
    $dumpfile("day15.vcd");
    $dumpvars(0, day15_tb);
  end

endmodule




