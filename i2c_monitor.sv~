
class i2c_monitor extends uvm_monitor;

    virtual apb_if apb_vif;

    uvm_analysis_port #(apb_trans) ap;

    `uvm_component_utils(i2c_monitor)

    function new(string name="i2c_monitor",uvm_component parent = null);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual apb_if)::get(this,"","apb_vif",apb_vif))
            `uvm_fatal("i2c_monitor","virtual interface must be set for apb_vif")
        ap = new("ap",this);
    endfunction

    extern task main_phase(uvm_phase phase);
    extern task collect_one_pkt(apb_trans tr);

endclass

task i2c_monitor::main_phase(uvm_phase phase);
    apb_trans tr;
    while(1) begin
        tr = new("tr");
        collect_one_pkt(tr);
        ap.write(tr);
    end
endtask

task i2c_monitor::collect_one_pkt(apb_trans tr);
  
    `uvm_info("i2c monitor", "begin collect one pkt", UVM_LOW);
        wait(apb_vif.psel_i == 1'b1)
        @(posedge apb_vif.p_clk);
        tr.penable_i = apb_vif.penable_i;
        tr.prdata_o = apb_vif.prdata_o;
        tr.pslverr_o = apb_vif.pslverr_o;
        tr.pready_o = apb_vif.pready_o;
        tr.psel_i = apb_vif.psel_i;
        tr.paddr_i = apb_vif.paddr_i;
        tr.pwrite_i = apb_vif.pwrite_i;
        tr.pwdata_i = apb_vif.pwdata_i;
        
    tr.print();
    `uvm_info("i2c_monitor","end collect one pkt",UVM_LOW);

endtask
