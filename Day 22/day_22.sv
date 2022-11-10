`timescale 1ns / 1ps
// Hello world from SV classes

class day22;

  function new();
    // Nothing to do here
  endfunction

  function void print_hello();
    $display("Hello, World!\n");
  endfunction

endclass


module day_22_tb();

  day22 DAY22;

  initial begin
    DAY22 = new();
    DAY22.print_hello();
    $finish();
  end

endmodule


