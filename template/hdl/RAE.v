//`define L1_BUFFER

module RAE(
    input               clk,
    input               rst_n,
    input       [23:0]  conf,
    input               valid,
    output reg          ready,
    output reg  [1:0]   status,

    // Dual-port weight ports
    output reg          sram_weight_cen,
    output reg  [ 3:0]  sram_weight_wea0,
    output reg  [15:0]  sram_weight_addr0,
    output reg  [31:0]  sram_weight_wdata0,
    input       [31:0]  sram_weight_rdata0,
    output reg  [ 3:0]  sram_weight_wea1,
    output reg  [15:0]  sram_weight_addr1,
    output reg  [31:0]  sram_weight_wdata1,
    input       [31:0]  sram_weight_rdata1,

    // Dual-port activation ports
    output reg         sram_act_cen,
    output reg  [ 3:0] sram_act_wea0,
    output reg  [15:0] sram_act_addr0,
    output reg  [31:0] sram_act_wdata0,
    input       [31:0] sram_act_rdata0,
    output reg  [ 3:0] sram_act_wea1,
    output reg  [15:0] sram_act_addr1,
    output reg  [31:0] sram_act_wdata1,
    input       [31:0] sram_act_rdata1
);

// Add your design here

`ifdef L1_BUFFER
    // 1. Modify this block for your L1 banks
    // 2. Modify the above RAE and SRAM connections for this feature
	
	wire 		bank0_cen, bank1_cen;
	wire [3:0]	bank0_wea0, bank0_wea1, bank1_wea0, bank1_wea1;
	wire [7:0]	bank0_addr0, bank0_addr1, bank1_addr0, bank1_addr1;	
	wire [31:0] bank0_wdata0, bank0_wdata1, bank1_wdata0, bank1_wdata1;
	wire [31:0]	bank0_rdata0, bank0_rdata1, bank1_rdata0, bank1_rdata1;
	
    L1_SRAM_256x32b bank0(
    .clk(clk),
    .cen(bank0_cen),
    .wea0(bank0_wea0),
    .addr0(bank0_addr0),
    .wdata0(bank0_wdata0),
    .rdata0(bank0_rdata1),
	.wea1(bank0_wea1),
    .addr1(bank0_addr1),
    .wdata1(bank0_wdata1),
    .rdata1(bank0_rdata1)
    );

    L1_SRAM_256x32b bank1(
    .clk(clk),
    .cen(bank1_cen),
    .wea0(bank1_wea0),
    .addr0(bank1_addr0),
    .wdata0(bank1_wdata0),
    .rdata0(bank1_rdata0)
	.wea1(bank1_wea1),
    .addr1(bank1_addr1),
    .wdata1(bank1_wdata1),
    .rdata1(bank1_rdata1)
    );
`endif
  
endmodule
