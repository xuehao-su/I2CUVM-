class i2c_reg_bus_monitor extends uvm_monitor;

    virtual apb_if vif;

    uvm_analysis_port #(apb_trans) ap;
    `uvm_component_utils(i2c_reg_bus_monitor)

    function new(string name = "i2c_reg_bus_monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual apb_if)::get(this, "", "vif", vif))
            `uvm_fatal("i2c_reg_bus_monitor","virtual reg bus interface is not set")
        ap = new("ap", this);
    endfunction

    task run_phase(uvm_phase phase);
        forever begin
            mon_trans();
        end
    endtask


    task mon_trans();
        apb_trans t;
        @(posedge vif.p_clk);
        if(vif.pwrite_i == 1) begin
            t = new();
            t.pwrite_i = 1;
            t.paddr_i = vif.paddr_i;
            t.pwdata_i = vif.pwdata_i;
            ap.write(t);
        end
        else if(vif.pwrite_i == 0) begin
            t = new();
            t.pwrite_i = 0;
            t.paddr_i = vif.paddr_i;
            fork
                @(posedge vif.p_clk);
                #10ps;
                t.prdata_o = vif.prdata_o;
                ap.write(t);
            join_none
        end
    endtask
endclass
