class slave_sqr extends uvm_sequencer #(apb_trans);
    
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    `uvm_component_utils(slave_sqr)

endclass
