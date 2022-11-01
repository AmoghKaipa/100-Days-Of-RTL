`timescale 1ns / 1ps
/*
APB - Advanced Peripheral Bus Protocol.

* It is a simple protocol for transaction between master and slave
* It is a Non-pipeline protocol -> Once a transaction is initiated, all signals(control and data signals) related to a transaction from the master should remain stable till the slave accepts the transaction.
* It is used in SoC's. processors, N/Wing chips.
* Used for simple requiremens like reading/writing from slave.
* It consumes less area and less power.
* Debug processes uses APB protocol.
* SoCs use many peripherals. Hence APB is used here.

Signals are:

pclk
presetn
psel[n-1:0] - selects which slave this transaction is meant to be
penable - always asseretd after one clock cycle after psel signal. This is needed because most of the SoCs uses clock gating and the it will be in low power mode when it is not on. 
pwrite - 0-> read from slave 1-> write from slave
paddr -> To which address you want to write request to.
pwdata 
prdata  
pready - Indicates that slave is ready to accept the transaction.
pslverr - Tells that transaction coudnt be processed by the slave and it raised an err s/g and trasnaction needs to be reinitiated. This is usually due to a security issue.

The txn is completed only preay is asserted.
pslverr can be asserted only when pready is asserted.


States of the protocol:

1. IDLE - nothing is active. no transaction. psel = 0, penalbe = 0
2. SETUP - when we want to initiate a txn. psel = 1 and penale = 0. Protocaol can be in Setup state only for one clk cycle. Else it is a violation of the protocol.
3. ACCESS - psel = 1, penable = 1; It will remain in access state till pready = 1. Here, pwrite, pwdata, prdata is stable. 
From access state, we can go to IDLE or SETUP state.


In case of violation, slave behaves in an awkward manner. This happens when Data/address s/g changes during access phase. This is a common problem is SoC. It leads to timing problem.



*/


module day_16(input       wire        clk,
              input       wire        reset,
              input       wire[1:0]   cmd_i,
              output      wire        psel_o,
              output      wire        penable_o,
              output      wire[31:0]  paddr_o,
              output      wire        pwrite_o,
              output      wire[31:0]  pwdata_o,
              input       wire        pready_i,
              input       wire[31:0]  prdata_i
             );

typedef enum logic[1:0] {ST_IDLE = 2'b00, ST_SETUP = 2'b01, ST_ACCESS = 2'b10} apb_state_t;
logic[31:0] rdata_q;
logic [1:0] state, next_state;
always_ff @(posedge clk, posedge reset) begin
    if(reset)
        state <= ST_IDLE;
    else
        state <= next_state;
end

always_comb begin
    case(state)
        ST_IDLE : next_state = cmd_i? ST_SETUP:ST_IDLE;
        ST_SETUP : next_state = ST_ACCESS;
        ST_ACCESS : if(pready_i) begin next_state = ST_IDLE; end
        default : next_state = state;    
    endcase
end

assign psel_o = (state == ST_SETUP) | (state == ST_ACCESS);
assign penable_o = (state == ST_ACCESS);
assign pwrite_o = cmd_i[1];
assign paddr_o = 32'hDEAD_CAFE;
assign pwdata_o = rdata_q + 32'h1; 

always_ff @(posedge clk or posedge reset) begin
    if (reset) 
        rdata_q <= 32'h0;
    else if (penable_o && pready_i)
        rdata_q <=  prdata_i;     
end


endmodule
