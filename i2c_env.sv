
class i2c_env extends uvm_env;

    i2c_agent i2c_agt;
    
    function new(string name = "i2c_env", uvm_component parent);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        i2c_agt = i2c_agent::type_id::create("i2c_agt",this);
        i2c_agt.is_active = UVM_ACTIVE;
        
    endfunction
    extern function void connect_phase(uvm_phase phase);
    `uvm_component_utils(i2c_env)
endclass

function void i2c_env::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
endfunction

