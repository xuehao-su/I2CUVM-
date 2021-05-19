class my_case0 extends base_test;

    function new(string name = "my_case0", uvm_component parent = null);
        super.new(name,parent);
    endfunction

    extern virtual function void build_phase(uvm_phase phase);
    `uvm_component_utils(my_case0)
endclass

function void my_case0::build_phase(uvm_phase phase);
    super.build_phase(phase);
    uvm_config_db#(uvm_object_wrapper)::set(this,
                                            "env.agt.sqr.main_phase",
                                            "default_sequence",
                                            apb_bus_seq::type_id::get());
    uvm_config_db#(uvm_object_wrapper)::set(this,
                                            "env.slv_agt.sqr.main_phase",
                                            "default_sequence",
                                            slave_seq::type_id::get());
endfunction
