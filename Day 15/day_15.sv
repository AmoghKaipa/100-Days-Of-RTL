`timescale 1ns / 1ps

// Priority arbiter without starvation
// Arbiter grants access to the device with the highest priority for a clock cycle. 
// But, if the same device was granted access in the previous clock cycle, 
// the device with the next priority is given access in the present clock cycle
// Day 14 module is also used here to find out the grant signal based on the priority

 
module day15 (
  input     wire        clk,
  input     wire        reset,

  input     wire[3:0]   req_i,
  output    logic[3:0]  gnt_o
);

  // Use mask to identify the last grant
  logic [3:0] mask_q;
  logic [3:0] nxt_mask;

  always_ff @(posedge clk or posedge reset)
    if (reset)
      mask_q <= 4'hF;
    else
      mask_q <= nxt_mask;

  // Next mask based on the current grant
  // Mask is used so that the same device is not granted access in the next clock cycle also
  always_comb begin
    nxt_mask = mask_q;
         if (gnt_o[0]) nxt_mask = 4'b1110;
    else if (gnt_o[1]) nxt_mask = 4'b1100;
    else if (gnt_o[2]) nxt_mask = 4'b1000;
    else if (gnt_o[3]) nxt_mask = 4'b0000;
  end

  // Generate the masked requests
  logic [3:0] mask_req;

  assign mask_req = req_i & mask_q;

  logic [3:0] mask_gnt;
  logic [3:0] raw_gnt;
  // Generate grants for req and masked req
  // Need to generate maskedGnt to avoid starvation
  // Need to generate rawGnt in case the same device alone requested for access in both cycles
  day_14 #(4) maskedGnt (.req_i (mask_req), .gnt_o (mask_gnt));
  day_14 #(4) rawGnt    (.req_i (req_i),    .gnt_o (raw_gnt));

  // Final grant based on mask req
  
  assign gnt_o = |mask_req ? mask_gnt : raw_gnt;

endmodule
