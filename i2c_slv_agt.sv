class i2c_slv_agt extends uvm_agent;

    scl_sda_mon mon;
    slave_sqr sqr;
    slave_driver drv;

    `uvm_component_utils(i2c_slv_agt)

    function new(string name="i2c_slv_agt", uvm_component parent=null);
        super.new(name,parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        sqr = slave_sqr::type_id::create("sqr", this);
        drv = slave_driver::type_id::create("drv", this);
        mon = scl_sda_mon::type_id::create("mon",this);
    endfunction


    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        drv.seq_item_port.connect(sqr.seq_item_export);
    endfunction


endclass
