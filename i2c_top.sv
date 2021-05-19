`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "i2c_macro.sv"

`include "i2c_if.sv"
`include "i2c_trans.sv"
`include "i2c_sqr.sv"
`include "slave_sqr.sv"
`include "i2c_reg.sv"
`include "i2c_reg_bus_sqr.sv"
`include "i2c_seq.sv"
`include "slave_seq.sv"
`include "i2c_adapter.sv"
`include "i2c_driver.sv"
`include "slave_driver.sv"
`include "i2c_reg_bus_driver.sv"
`include "i2c_monitor.sv"
`include "i2c_reg_bus_monitor.sv"
`include "scl_sda_mon.sv"
`include "i2c_agent.sv"
`include "i2c_reg_bus_agent.sv"
`include "i2c_env.sv"
`include "i2c_slv_agt.sv"
`include "i2c_reg_bus_env.sv"
`include "i2c_base_test.sv"
`include "i2c_case0.sv"
`include "i2c_manifest.v"

module i2c_top;

wire SCL;
wire SDA;

reg slave_oe;
reg master_oe;

reg apb_clk;
reg apb_reset_n;

reg i2c_core_clk;
reg i2c_reset_n;

apb_if vif(apb_clk, apb_reset_n);
apb_if slv_vif(apb_clk, apb_reset_n);
dma_if dma_if();
i2c_if scl_sda(i2c_core_clk,i2c_reset_n);
i2c_if slave(i2c_core_clk,i2c_reset_n);
PAD_if pad(
.scl(SCL),
.sda(SDA)
);

I2C_APB_top my_dut(

    .clk                    (i2c_core_clk),
    .reset_n                (i2c_reset_n),
  
    .pclk_i                 (apb_clk),
    .preset_n_i             (apb_reset_n),
    .penable_i              (vif.penable_i),
    .pwrite_i               (vif.pwrite_i),
    .pwdata_i               (vif.pwdata_i),
    .paddr_i                (vif.paddr_i),
    .prdata_o               (vif.prdata_o),
    .pready_o               (vif.pready_o),
    .pselx_i                (vif.psel_i),
    .pslverr_o              (vif.pslverr_o),


    .dma_req_o              (),
    .dma_lreq_o             (),
    .dma_clr_i              (),
    .dma_tc_i               (),

    .i2c_scl_i              (scl_sda.scl_i),
    .i2c_sda_i              (scl_sda.sda_i),
    .i2c_scl_o              (scl_sda.scl_o),
    .i2c_sda_o              (scl_sda.sda_o),
    .i2c_IRQ                (scl_sda.IRQ)
);
I2C_APB_top slv_dut(

    .clk                    (i2c_core_clk),
    .reset_n                (i2c_reset_n),
  
    .pclk_i                 (apb_clk),
    .preset_n_i             (apb_reset_n),
    .penable_i              (slv_vif.penable_i),
    .pwrite_i               (slv_vif.pwrite_i),
    .pwdata_i               (slv_vif.pwdata_i),
    .paddr_i                (slv_vif.paddr_i),
    .prdata_o               (slv_vif.prdata_o),
    .pready_o               (slv_vif.pready_o),
    .pselx_i                (slv_vif.psel_i),
    .pslverr_o              (slv_vif.pslverr_o),


    .dma_req_o              (),
    .dma_lreq_o             (),
    .dma_clr_i              (),
    .dma_tc_i               (),

    .i2c_scl_i              (slave.scl_i),
    .i2c_sda_i              (slave.sda_i),
    .i2c_scl_o              (slave.scl_o),
    .i2c_sda_o              (slave.sda_o),
    .i2c_IRQ                (slave.IRQ)
);


PBS16RNC U_1_SCL(
.PAD(SCL),
.IE(1'b1),
.OEN(1'b0),
.I(scl_sda.scl_o),
.C(scl_sda.scl_i)
);
PBS16RNC U_1_SDA(
.PAD(SDA),
.IE(1'b1),
.OEN(master_oe),
.I(scl_sda.sda_o),
.C(scl_sda.sda_i)
);
initial begin
    slave_oe = 1'b1;
    master_oe = 1'b0;
forever begin
@(negedge slave.sda_o) begin
    slave_oe = 1'b0;
    master_oe = 1'b1;
end
@(posedge slave.sda_o) begin
    slave_oe = 1'b1;
    master_oe = 1'b0;
end
end
end

PBS16RNC U_2_SCL(
.PAD(SCL),
.IE(1'b1),
.OEN(1'b1),
.I(slave.scl_o),
.C(slave.scl_i)
);

PBS16RNC U_2_SDA(
.PAD(SDA),
.IE(1'b1),
.OEN(slave_oe),
.I(slave.sda_o),
.C(slave.sda_i)
);

/*
initial begin
forever begin
#1 scl_sda.scl_i = scl_sda.scl_o;
#1 scl_sda.sda_i = scl_sda.sda_o;

#1 slave.scl_i = slave.scl_o;
#1 slave.sda_i = slave.sda_o;
end
end*/
pullup(SCL);
pullup(SDA);

initial begin
    apb_clk = 0;
    forever begin
        #20 apb_clk = ~apb_clk;
    end
end

initial begin
    apb_reset_n = 1;
    #1000;
    apb_reset_n = 0;
    #10000;
    apb_reset_n = 1;
end

initial begin
    i2c_core_clk = 0;
    forever begin
        #20 i2c_core_clk = ~i2c_core_clk;
    end
end

initial begin
    i2c_reset_n = 1;
    #100;
    i2c_reset_n = 0;
    #10000;
    i2c_reset_n = 1;
end



initial begin
    run_test();
end


initial begin
    uvm_config_db#(virtual apb_if)::set(null, "uvm_test_top.env.agt.drv", "vif", vif);
    uvm_config_db#(virtual apb_if)::set(null, "uvm_test_top.env.agt.mon", "vif", vif);
    uvm_config_db#(virtual apb_if)::set(null, "uvm_test_top.env.slv_agt.drv","slv_vif",slv_vif);
    uvm_config_db#(virtual i2c_if)::set(null, "uvm_test_top.env.slv_agt.mon","slave",slave);
    uvm_config_db#(virtual i2c_if)::set(null, "uvm_test_top.env.slv_agt.mon", "scl_sda", scl_sda);
    uvm_config_db#(virtual PAD_if)::set(null, "uvm_test_top.env.slv_agt.mon","pad",pad);
end



endmodule








