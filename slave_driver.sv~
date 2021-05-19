class slave_driver extends uvm_driver #(apb_trans);

    virtual apb_if slv_vif;

    `uvm_component_utils(slave_driver)
  
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db#(virtual apb_if)::get(this, "", "slv_vif",slv_vif))
            `uvm_fatal("slave_driver", "virtual apb interface is not set")
    endfunction

    task run_phase(uvm_phase phase);
        REQ tmp;
        apb_trans req, rsp;
        reset_listener();
        forever begin
            seq_item_port.get_next_item(tmp);
            void'($cast(req,tmp));
           // `uvm_info("reg bus driver","got a item \n", UVM_LOW)
            void'($cast(rsp,req.clone()));
            rsp.set_sequence_id(req.get_sequence_id());
            rsp.set_transaction_id(req.get_transaction_id());
            drive_bus(rsp);
            seq_item_port.item_done(rsp);
           // `uvm_info("reg bus driver", "sent a item \n", UVM_LOW)
        end
    endtask

    task reset_listener();

        fork
            forever begin
                @(negedge slv_vif.p_rst_n) drive_idle();
            end
        join_none

    endtask

    task drive_bus(apb_trans t);
        case(t.pwrite_i)
            1: drive_write(t);
            0: drive_read(t);
            
            default: `uvm_error("reg bus driver", "invalid bus command")
        endcase
    endtask

    task drive_idle(bit is_sync=0);
        if(is_sync) @(posedge slv_vif.p_clk);
        slv_vif.psel_i <= 'h0;
        slv_vif.penable_i <= 'h0;
        slv_vif.paddr_i <= 'h0;
        slv_vif.pwdata_i <= 'h0;
        slv_vif.pwrite_i <= 'h0;
          
    endtask


    task drive_read(apb_trans t);
        repeat(5)@(posedge slv_vif.p_clk);
        slv_vif.psel_i <= 1'b1;
        slv_vif.paddr_i <= t.paddr_i;
        slv_vif.pwrite_i <= t.pwrite_i;

        wait(slv_vif.psel_i == 1'b1)
        @(posedge slv_vif.p_clk);
        slv_vif.penable_i <= 1'b1;
        wait(slv_vif.pready_o ==1'b1);
        @(posedge slv_vif.p_clk);
        slv_vif.penable_i <= 1'b0;
        slv_vif.psel_i    <= 1'b0;
        slv_vif.pwrite_i <= 0;
        repeat(100)@(posedge slv_vif.p_clk);
        t.prdata_o = slv_vif.prdata_o;
    endtask


    task drive_write(apb_trans t);
        
        repeat(5)@(posedge slv_vif.p_clk);
        slv_vif.psel_i <= 1'b1;
        slv_vif.paddr_i <= t.paddr_i;
        slv_vif.pwrite_i <= t.pwrite_i;
        slv_vif.pwdata_i <= t.pwdata_i;

        wait(slv_vif.psel_i == 1'b1)
        @(posedge slv_vif.p_clk);
        slv_vif.penable_i <= 1'b1;

        wait(slv_vif.pready_o ==1'b1);
        @(posedge slv_vif.p_clk);
        slv_vif.penable_i <= 1'b0;
        slv_vif.psel_i    <= 1'b0;
        slv_vif.pwrite_i <= 0;

    endtask

endclass
