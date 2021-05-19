class i2c_reg_bus_agent extends uvm_agent;

    i2c_reg_bus_sqr sqr;
    i2c_reg_bus_driver drv;
    i2c_reg_bus_monitor mon;

    uvm_analysis_port #(apb_trans) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    extern virtual function void build_phase(uvm_phase phase);
    extern virtual function void connect_phase(uvm_phase phase);

    `uvm_component_utils(i2c_reg_bus_agent)

endclass

function void i2c_reg_bus_agent::build_phase(uvm_phase phase);

    super.build_phase(phase);
    if(is_active == UVM_ACTIVE) begin
        sqr = i2c_reg_bus_sqr::type_id::create("sqr", this);
        drv = i2c_reg_bus_driver::type_id::create("drv", this);
    end

    mon = i2c_reg_bus_monitor::type_id::create("mon", this);

endfunction

function void i2c_reg_bus_agent::connect_phase(uvm_phase phase);

    super.connect_phase(phase);
    if(is_active == UVM_ACTIVE) begin
        drv.seq_item_port.connect(sqr.seq_item_export);
    end
    ap = mon.ap;

endfunction
