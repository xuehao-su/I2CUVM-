
class i2c_reg_bus_env extends uvm_env;
  
    i2c_reg_bus_agent agt;
    i2c_reg_model rgm;
    i2c_adapter reg2dut;


    i2c_slv_agt slv_agt;
    i2c_reg_model slave_rgm;
    i2c_adapter   slave_adapter;

    `uvm_component_utils(i2c_reg_bus_env)

    
    function new(string name="i2c_reg_bus_env", uvm_component parent);
        super.new(name,parent);
    endfunction



    function void build_phase(uvm_phase phase);
        agt = i2c_reg_bus_agent::type_id::create("agt",this);
        agt.is_active = UVM_ACTIVE;

        slv_agt = i2c_slv_agt::type_id::create("slv_agt",this);

        if(!uvm_config_db#(i2c_reg_model)::get(this,"","rgm",rgm))begin
            `uvm_info("get rgm", "no top down rgm handle is assigned", UVM_LOW)
            rgm = i2c_reg_model::type_id::create("rgm",this);
            `uvm_info("new rgm", "created rgm instance locally", UVM_LOW)
        end
        //rgm.configure(null,"");
        rgm.build();
        rgm.lock_model();
        rgm.reset();
        rgm.default_map.set_auto_predict();
        //rgm.set_hdl_path_root("i2c_top.my_dut");
        reg2dut = i2c_adapter::type_id::create("reg2dut");

        if(!uvm_config_db#(i2c_reg_model)::get(this,"","slave_rgm",slave_rgm))begin
            `uvm_info("get slave rgm", "no top down slave rgm handle is assigned",UVM_LOW)
            slave_rgm = i2c_reg_model::type_id::create("slave_rgm",this);
            `uvm_info("new slave rgm","created slave rgm instance locally",UVM_LOW)
        end

        slave_rgm.build();
        slave_rgm.lock_model();
        slave_rgm.reset();
        slave_rgm.default_map.set_auto_predict();
        slave_adapter = i2c_adapter::type_id::create("slave_adapter");

    endfunction

    function void connect_phase(uvm_phase phase);
        rgm.default_map.set_sequencer(agt.sqr, reg2dut);

        slave_rgm.default_map.set_sequencer(slv_agt.sqr, slave_adapter);
    endfunction

endclass
