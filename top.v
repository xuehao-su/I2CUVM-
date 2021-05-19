//FIX_ME for pcie verification `include "board_common.vh"
  module top();
  wire          clk;
  wire          rst_n; 
  wire          pll_rst_n;
  //add by wangfeng
  wire          uart5_rx;
  wire 	        uart5_tx;

  wire          spi_fmc_clk;
  
  wire          spi_fmc_cs0;  
  wire          spi_fmc_io0;  
  wire          spi_fmc_io1;   
  wire          spi_fmc_io2;  
  wire          spi_fmc_io3;  
  
  wire          sd_cmd;          
  wire  [3:0]   sd_dat;
  wire          sd_clk_pad_o;
  
  wire  [7:0]   GPIOF;
  wire  [7:0]   GPIOM;
  wire  [7:0]   GPIOW;                   

  wire          PECI; 
    
//*******************apb*****************************
reg                  psel_master;    
reg                  penable_master; 
reg                  pwrite_master;  
reg      [31:0]      paddr_master;   
reg      [31:0]      pwdata_master;  
wire                 pready_master;  
wire     [31:0]      prdata_master;  
wire                 pslverr_master; 
reg                  psel_slave;    
reg                  penable_slave; 
reg                  pwrite_slave;  
reg      [31:0]      paddr_slave;   
reg      [31:0]      pwdata_slave;  
wire                 pready_slave;  
wire     [31:0]      prdata_slave;  
wire                 pslverr_slave; 

//*******************I3C*******************************************
  wire          I3C_SDA;   
  wire          I3C_SCL;   
  wire          i3c1_scl_oe;
  wire          i3c1_scl_pullup_en;
  wire          i3c1_scl_in_a;
  wire          i3c1_scl_out;
  wire          i3c2_scl_oe;
  wire          i3c2_scl_pullup_en;
  wire          i3c2_scl_in_a;
  wire          i3c2_scl_out;
  wire          i3c1_sda_oe;
  wire          i3c1_sda_pullup_en;
  wire          i3c1_sda_in_a;
  wire          i3c1_sda_out;
  wire          i3c2_sda_oe;
  wire          i3c2_sda_pullup_en;
  wire          i3c2_sda_in_a;
  wire          i3c2_sda_out;

//***************************************************************
  wire          clk_50m;
  wire          clk_125m;
  wire          pcie_ep_txn;
  wire          pcie_ep_txp;
  wire          pcie_ep_rxp;
  wire          pcie_ep_rxn;
  reg           sys_rst_n;   
  reg           chip_rst_l;
  reg           soc_rst_l;


  clk_gen       clk_gen(
                .clk(clk),
                .clk_50m(clk_50m),
		.clk_125m(clk_125m),
		.pll_rst_n(pll_rst_n),
		.chip_rst_l(chip_rst_l),
		.soc_rst_l(soc_rst_l),
                .rst_n(rst_n)
           );
    reg       [4:0]    cnt_master;
    reg       [4:0]    cnt_slave;       

    reg    [31:0]   timing_cnt;
    
    always @(posedge clk_50m or negedge chip_rst_l)
    begin
        if(!chip_rst_l)begin
            cnt_master       <= 5'h0;
            paddr_master     <= 'h0;
            psel_master     <= 1'b0;
            penable_master   <= 1'b0;
            pwrite_master    <= 1'b0;
            pwdata_master    <= 'h0;
            timing_cnt       <= 'h0;
            //pstrb_master     <= 'h0;
        end
        else begin
            case(cnt_master)
                5'h0:begin
                    paddr_master     <= 'h0;
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    pwrite_master    <= 1'b0;
                    pwdata_master    <= 'h0;
                    //pstrb_master     <= 'h0;
                    cnt_master  <= 5'h1;
                end
                5'h1:begin
                	  if(pready_master)begin
                    //paddr_master     <= 'h1c;  //主从机地址
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h04040400;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h2;
                    end
                    else begin
                    paddr_master     <= 'h1C;  //主从机地址
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h04040400;
                    end
                end
                5'h2:begin
                	  if(pready_master)begin
                    //paddr_master     <= 'h20;  //主从机地址
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h01000101;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h3;
                    end
                    else begin
                    paddr_master     <= 'h20;  //主从机地址
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h01000101;
                    end
                end
                5'h3:begin
                	  if(pready_master)begin
                    //paddr_master     <= 'h04;  //主从机地址
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h80530000;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h4;
                    end
                    else begin
                    paddr_master     <= 'h04;  //主从机地址
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h80530000;
                    end
                end
                5'h4:begin
                    if(pready_master)begin
                    //paddr_master     <= 'h220;  //中断全部不使能
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h805d0000;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h5;
                    end
                    else begin
                    paddr_master     <= 'h220;  //中断全部不使能
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h805d0000;	
                    end
                end
                5'h5:begin
                	  if(pready_master)begin
                    //paddr_master     <= 'h0;  //中断全部不使能
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h80000001;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h6;
                    end
                    else begin
                    paddr_master     <= 'h0;  //中断全部不使能
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'hC0000001;	//'h80000001;	
                    end
                end
                5'h6:begin
                	  if(timing_cnt==32'hffff)begin
                    //paddr_master     <= 'h0;  //中断全部不使能
                        timing_cnt <= 'h0;
                        cnt_master  <= 5'h7;
                    end
                    else begin
                        timing_cnt <= timing_cnt + 1'b1;
                    end
                end
                5'h7:begin
                    if(pready_master)begin
                    //paddr_master     <= 'h0c;  //中断全部不使能
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h0420438b;//'h44200383;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h8;
                    end
                    else begin
                    paddr_master     <= 'h0c;  //中断全部不使能
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h44200383;//'h0420438b;
                    end
                end
                5'h8:begin
                    if(pready_master)begin
                    //paddr_master     <= 'h0c;  //中断全部不使能
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    //pwrite_master    <= 1'b0;
                    //pwdata_master    <= 'h0420438b;//'h44200383;
                    //pstrb_master     <= 'h1;
                        cnt_master  <= 5'h9;
                    end
                    else begin
                    paddr_master     <= 'h0c;  //中断全部不使能
                    psel_master     <= 1'b1;
                    if(psel_master)begin
                    	penable_master   <= 1'b1;
                    end
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h44200383;//'h0420438b;
                    end
                end
//                5'h7:begin
//                    if(pready_master)begin
//                    //paddr_master     <= 'h0c;  //中断全部不使能
//                    psel_master     <= 1'b0;
//                    penable_master   <= 1'b0;
//                    //pwrite_master    <= 1'b0;
//                    //pwdata_master    <= 'h0420438b;//'h44200383;
//                    //pstrb_master     <= 'h1;
//                        cnt_master  <= 5'h9;
//                    end
//                    else begin
//                    paddr_master     <= 'h0c;  //中断全部不使能
//                    psel_master     <= 1'b1;
//                    if(psel_master)begin
//                    	penable_master   <= 1'b1;
//                    end
//                    pwrite_master    <= 1'b1;
//                    pwdata_master    <= 'h0420438b;//'h44200383;	
//                    end
//                end

//                5'h7:begin
//                    paddr_master     <= 'h40<<2;   //主寄存器数据
//                    psel_master     <= 1'b1;
//                    penable_master   <= 1'b1;
//                    pwrite_master    <= 1'b1;
//                    pwdata_master    <= 'h35;
//                    pstrb_master     <= 'h1;
//                    if(pready_master)begin
//                        cnt_master  <= 5'h8;
//                    end
//                end
                /*
                5'h10:begin
                    paddr_master     <= 'h40<<2;   //主寄存器数据
                    psel_master     <= 1'b1;
                    penable_master   <= 1'b1;
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h35;
                    pstrb_master     <= 'h1;
                    if(pready_master)begin
                        cnt_master  <= 5'h11;
                    end
                end
                5'h11:begin
                    paddr_master     <= 'h40<<2;   //主寄存器数据
                    psel_master     <= 1'b1;
                    penable_master   <= 1'b1;
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h35;
                    pstrb_master     <= 'h1;
                    if(pready_master)begin
                        cnt_master  <= 5'h12;
                    end
                end
                5'h12:begin
                    paddr_master     <= 'h40<<2;   //主寄存器数据
                    psel_master     <= 1'b1;
                    penable_master   <= 1'b1;
                    pwrite_master    <= 1'b1;
                    pwdata_master    <= 'h35;
                    pstrb_master     <= 'h1;
                    if(pready_master)begin
                        cnt_master  <= 5'h13;
                    end
                end
                */
//                5'h9:begin
//                    paddr_master     <= 'h46<<2;  //控制寄存器
//                    psel_master     <= 1'b1;
//                    penable_master   <= 1'b1;
//                    pwrite_master    <= 1'b1;
//                    pwdata_master    <= 'h01;
//                    pstrb_master     <= 'h1;
//                    if(pready_master)begin
//                        cnt_master  <= 5'h10;
//                    end
//                end
                5'h9:begin
                    //master_int       <= 1'b0;
                    paddr_master     <= 'h0;
                    psel_master     <= 1'b0;
                    penable_master   <= 1'b0;
                    pwrite_master    <= 1'b0;
                    pwdata_master    <= 'h0;
                    //pstrb_master     <= 'h0;
                    if(pready_master)begin
                        cnt_master  <= 5'h9;
                    end
                end
            endcase
        end
    end
    
    reg    [31:0]   prsent_reg;
    
    always @(posedge clk_50m or negedge chip_rst_l)
    begin
        if(!chip_rst_l)begin
            cnt_slave       <= 5'h0;
            paddr_slave     <= 'h0;
            psel_slave     <= 1'b0;
            penable_slave   <= 1'b0;
            pwrite_slave    <= 1'b0;
            pwdata_slave    <= 'h0;
            //pstrb_slave     <= 'h0;
        end
        else begin
            case(cnt_slave)
                5'h0:begin
                    paddr_slave     <= 'h0;
                    psel_slave     <= 1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'h0;
                    //pstrb_slave     <= 'h0;
                    cnt_slave       <= 5'h1;
                end
                5'h1:begin
                    paddr_slave     <= 'hb0;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
                    if(psel_slave)begin
                    penable_slave   <= 1'b1;
                    end
                    pwrite_slave    <= 1'b1;
                    pwdata_slave    <= 'h00000009;
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
                    paddr_slave     <= 'hb0;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'h00000009;
                        cnt_slave  <= 5'h2;
                    end
                end
                5'h2:begin
                    paddr_slave     <= 'h78;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
                    if(psel_slave)begin
                    penable_slave   <= 1'b1;
                    end
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'hc9000001;
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
                    paddr_slave     <= 'h78;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'hc9000001;
                    prsent_reg      <= prdata_slave;
                        cnt_slave  <= 5'h3;
                    end
                end
                5'h3:begin
                    paddr_slave     <= 'h78;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
                    if(psel_slave)begin
                    penable_slave   <= 1'b1;
                    end
                    pwrite_slave    <= 1'b1;
                    pwdata_slave    <= {prdata_slave[31:8],2'b00,prdata_slave[5:0]};
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
                    paddr_slave     <= 'h78;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= {prdata_slave[31:8],2'b00,prdata_slave[5:0]};
                        cnt_slave  <= 5'h5;
                    end
                end
                5'h4:begin
                    paddr_slave     <= 'h0;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
                    if(psel_slave)begin
                    penable_slave   <= 1'b1;
                    end
                    pwrite_slave    <= 1'b1;
                    pwdata_slave    <= 'hc1000001;
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
                    paddr_slave     <= 'h0;    //时钟分频系数     8bit传输配置I2C寄存器
                    psel_slave     <= 1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'hc1000001;
                        cnt_slave  <= 5'h9;
                    end
                end
                5'h5:begin
                    paddr_slave     <= 'h70;             //模式选择寄存器    8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
		    if(psel_slave)begin
			    penable_slave <= 1'b1;
	            end
		    pwrite_slave <= 1'b1;
		    pwdata_slave <='h00006667;
		    if(pready_slave)begin
	            paddr_slave <= 'h70;
		    psel_slave <=1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'h00006667;
                    cnt_slave  <= 5'h6;
                    end
                end
                5'h6:begin
                    paddr_slave     <= 'h74;           //状态寄存器    8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
		    if(psel_slave)begin
                        penable_slave   <= 1'b1;
	            end
                    pwrite_slave    <= 1'b1;
                    pwdata_slave    <= 'h66666666;
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
		    paddr_slave <= 'h74;
		    psel_slave <= 1'b0;
		    penable_slave <= 1'b0;
		    pwrite_slave <= 1'b0;
		    pwdata_slave <= 'h66666666;
                    cnt_slave  <= 5'h7;
                    end
                end
                5'h7:begin
                    paddr_slave     <= 'hd8;           //状态寄存器    8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
		    if(psel_slave)begin
                        penable_slave   <= 1'b1;
	            end
                    pwrite_slave    <= 1'b1;
                    pwdata_slave    <= 'h00000002;
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
	            paddr_slave <='hd8;
		    psel_slave <= 1'b0;
		    penable_slave <= 1'b0;
		    pwrite_slave <= 1'b0;
		    pwdata_slave <= 'h00000002;
                    cnt_slave  <= 5'h4;
                    end
                end
                5'h8:begin
                    paddr_slave     <= 'h12<<2;           //状态寄存器    8bit传输配置I2C寄存器
                    psel_slave     <= 1'b1;
                    penable_slave   <= 1'b1;
                    pwrite_slave    <= 1'b1;
                    pwdata_slave    <= 'h05;
                    //pstrb_slave     <= 'h1;
                    if(pready_slave)begin
                        cnt_slave  <= 5'h9;
                    end
                end
//                5'h9:begin
//                    paddr_slave     <= 'h46<<2;  //控制寄存器  8bit传输配置I2C寄存器
//                    psel_slave     <= 1'b1;
//                    penable_slave   <= 1'b1;
//                    pwrite_slave    <= 1'b1;
//                    pwdata_slave    <= 'h00;
//                    pstrb_slave     <= 'h1;
//                    if(pready_slave)begin
//                        cnt_slave  <= 5'h10;
//                    end
//                end
                5'h9:begin
                    //slave_int       <= 1'b0;
                    paddr_slave     <= 'h0;
                    psel_slave     <= 1'b0;
                    penable_slave   <= 1'b0;
                    pwrite_slave    <= 1'b0;
                    pwdata_slave    <= 'h0;
                    //pstrb_slave     <= 'h0;
                    if(pready_slave)begin
                        cnt_slave  <= 5'h9;
                    end
                end
            endcase
        end
    end
//****************************************************************** 

   PBCU8RNC U_i3c1_sda (                   
                      .PAD(I3C_SDA   ),
                      .IE (1'b1),
                      .OEN(~i3c1_sda_oe),
                      .REN(~i3c1_sda_pullup_en),
                      .I  (i3c1_sda_out ),
                      .C  (i3c1_sda_in_a )
                      );    

   PBCU8RNC U_i3c1_scl (                   
                      .PAD(I3C_SCL   ),
                      .IE (1'b1),
                      .OEN(~i3c1_scl_oe),
                      .REN(~i3c1_scl_pullup_en),
                      .I  (i3c1_scl_out),
                      .C  (i3c1_scl_in_a)
                      ); 
                      
   PBCU8RNC U_i3c2_sda (                   
                      .PAD(I3C_SDA   ),
                      .IE (1'b1),
                      .OEN(~i3c2_sda_oe),
                      .REN(~i3c2_sda_pullup_en),
                      .I  (i3c2_sda_out ),
                      .C  (i3c2_sda_in_a)
                      );    

   PBCU8RNC U_i3c2_scl (                   
                      .PAD(I3C_SCL   ),
                      .IE (1'b1),
                      .OEN(~i3c2_scl_oe),
                      .REN(~i3c2_scl_pullup_en),
                      .I  (i3c2_scl_out ),
                      .C  (i3c2_scl_in_a)
                      );

wire   [5:0]  GPIOJ;  //add by yuanxiuyang
wire   [5:0]  GPIOA;  //add by yuanxiuyang
wire      scl;       //add by yuanxiuyang
wire      sda;       //add by yuanxiuyang
           
           
           pullup(I3C_SCL);   //add by yuanxiuyang
           pullup(I3C_SDA);   //add by yuanxiuyang
 

//  parameter     sd_ramdisk = "/home/fuyy/verification/sdcard_model/ramdisk2.hex"; 
//  parameter     log_file = "/home/fuyy/verification/sdcard_model/sd_mode.log";
  parameter     sd_ramdisk = "./tb/sdcard_model/ramdisk2.hex"; 
  parameter     log_file = "./tb/sdcard_model/sd_mode.log";
  
  master_i3c_top i3c_top_inst0 (
             .pclk           (clk_50m),
             .presetn        (rst_n),
             .psel           (psel_master),
             .penable        (penable_master),
             .pwrite         (pwrite_master),
             .paddr          (paddr_master),
             .pwdata         (pwdata_master),
             .pready         (pready_master),
             .prdata         (prdata_master),
             .pslverr        (),


             .core_clk      (clk_125m),
             .core_rst_n    (soc_rst_l),
                            
             .ic_intr       (),
             
             .sda_oe       (i3c1_sda_oe),
             .scl_out      (i3c1_scl_out),
             .sda_out      (i3c1_sda_out),
             .scl_pullup_en(i3c1_scl_pullup_en),
             .sda_pullup_en(i3c1_sda_pullup_en),
             .scl_oe       (i3c1_scl_oe),
             .scl_in_a     (i3c1_scl_in_a),
             .sda_in_a     (i3c1_sda_in_a)

                     );
                     
  sec_i3c_top i3c_top_inst1 (
             .pclk           (clk_50m),
             .presetn        (rst_n),
             .psel           (psel_slave),
             .penable        (penable_slave),
             .pwrite         (pwrite_slave),
             .paddr          (paddr_slave),
             .pwdata         (pwdata_slave),
             .pready         (pready_slave),
             .prdata         (prdata_slave),
             .pslverr        (),


             .core_clk      (clk_125m),
             .core_rst_n    (soc_rst_l),
                            
             .ic_intr       (),
             
             .sda_oe       (i3c2_sda_oe),
             .scl_out      (i3c2_scl_out),
             .sda_out      (i3c2_sda_out),
             .scl_pullup_en(i3c2_scl_pullup_en),
             .sda_pullup_en(i3c2_sda_pullup_en),
             .scl_oe       (i3c2_scl_oe),
             .scl_in_a     (i3c2_scl_in_a),
             .sda_in_a     (i3c2_sda_in_a)

                     );


   


//*********************************************************************************
  //----------------------------------------------------------------
  //record wave 
  initial begin 
    //$recordsetup("design=dump","version=1","run=1","diretory=."); 
    $recordsetup("design=dump","version=1","run=1"); 
    $recordvars(top,"depth=6"); 
    //$fsdbdumpfile(bb.fsdb); 
    //$fsdbdumpvars(2,top); 


  end 
	   

  endmodule // lps_testbench

