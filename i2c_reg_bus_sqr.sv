

class i2c_reg_bus_sqr extends uvm_sequencer #(apb_trans);

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    `uvm_component_utils(i2c_reg_bus_sqr)

endclass
