class i2c_sequencer extends uvm_sequencer #(apb_trans);
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    `uvm_component_utils(i2c_sequencer)

endclass
