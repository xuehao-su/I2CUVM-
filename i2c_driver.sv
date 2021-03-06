
class i2c_driver extends uvm_driver#(apb_trans);

    virtual apb_if apb_vif;

    `uvm_component_utils(i2c_driver)

    function new(string name="i2c_driver",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual apb_if)::get(this,"","apb_vif",apb_vif))
            `uvm_fatal("i2c_driver","apb virtual interface is not set")
    endfunction

    extern task run_phase(uvm_phase phase);
    extern task drive_one_pkt(apb_trans apb_tr);

endclass



task i2c_driver::run_phase(uvm_phase phase);

    while(apb_vif.p_rst_n)
        @(posedge apb_vif.p_clk);
    while(1) begin
        seq_item_port.get_next_item(req);
        drive_one_pkt(req);
        seq_item_port.item_done();
    end

endtask



task i2c_driver::drive_one_pkt(apb_trans apb_tr);

    `uvm_info("i2c_driver","begin to drive one pkt",UVM_LOW);

    

    if(apb_vif.pready_o == 1'b1) begin
        @(posedge apb_vif.p_clk);
        apb_vif.penable_i <= 1'b0;
        apb_vif.psel_i    <= 1'b0;
        `uvm_info("i2c_driver","i2c controller is not ready, pkt is not driven", UVM_LOW);
    end

    else begin
        @(posedge apb_vif.p_clk);
        apb_vif.psel_i <= 1'b1;
        apb_vif.paddr_i <= apb_tr.paddr_i;
        apb_vif.pwrite_i <= apb_tr.pwrite_i;
        apb_vif.pwdata_i <= apb_tr.pwdata_i;

        wait(apb_vif.psel_i == 1'b1)
        @(posedge apb_vif.p_clk);
        apb_vif.penable_i <= 1'b1;

        @(posedge apb_vif.p_clk);
        apb_vif.penable_i <= 1'b0;
        apb_vif.psel_i    <= 1'b0;
    end

    `uvm_info("i2c_driver","end to drive one pkt",UVM_LOW);
    apb_tr.print();

endtask
