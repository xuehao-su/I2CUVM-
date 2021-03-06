

interface apb_if(input p_clk, input p_rst_n);
    logic                           penable_i;
    logic                           pwrite_i;
    logic [`APB_DATA_WIDTH-1:0]     pwdata_i;
    logic [`APB_ADDR_WIDTH-1:0]     paddr_i;
    logic [`APB_DATA_WIDTH-1:0]     prdata_o;
    logic                           pready_o;
    logic                           psel_i;
    logic                           pslverr_o;
endinterface


interface dma_if();
    logic                           dma_req_o;
    logic                           dma_lreq_o;
    logic                           dma_clr_i;
    logic                           dma_tc_i;
endinterface


interface i2c_if(input i2c_core_clk,input i2c_reset_n);
    logic                           scl_i;
    logic                           sda_i;
    logic                           scl_o;
    logic                           sda_o;
    logic                           IRQ;
endinterface


interface PAD_if(input scl, input sda);

endinterface
