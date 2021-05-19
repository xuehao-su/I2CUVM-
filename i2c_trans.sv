
class apb_trans extends uvm_sequence_item;

    rand bit                           penable_i;
    rand bit                           pwrite_i;
    rand bit [`APB_DATA_WIDTH-1:0]     pwdata_i;
    rand bit [`APB_ADDR_WIDTH-1:0]     paddr_i;
    bit      [`APB_DATA_WIDTH-1:0]     prdata_o;
    bit                                pready_o;
    rand bit                           psel_i;
    bit                                pslverr_o;
    
    `uvm_object_utils_begin(apb_trans)
        `uvm_field_int(penable_i, UVM_ALL_ON)
        `uvm_field_int(pwrite_i, UVM_ALL_ON)
        `uvm_field_int(pwdata_i, UVM_ALL_ON)
        `uvm_field_int(paddr_i, UVM_ALL_ON)
        `uvm_field_int(prdata_o, UVM_ALL_ON)
        `uvm_field_int(pready_o, UVM_ALL_ON)
        `uvm_field_int(psel_i, UVM_ALL_ON)
        `uvm_field_int(pslverr_o, UVM_ALL_ON)
    `uvm_object_utils_end


    function new(string name = "apb_trans");
        super.new();
    endfunction

endclass
