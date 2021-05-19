class apb_bus_seq extends uvm_reg_sequence;

    apb_trans apb_tr;
    i2c_reg_model rgm;

    function new(string name="apb_bus_seq");
        super.new(name);
    endfunction


    virtual task body();
        uvm_status_e status;
uvm_status_e status1;
uvm_status_e status2;
uvm_status_e status3;
uvm_status_e status4;
uvm_status_e status5;
uvm_status_e status6;
uvm_status_e status7;
        uvm_reg_data_t data;
uvm_reg_data_t data1;
uvm_reg_data_t data2;
uvm_reg_data_t data3;
uvm_reg_data_t data4;
uvm_reg_data_t data5;
uvm_reg_data_t data6;
uvm_reg_data_t data7;
        uvm_config_db#(i2c_reg_model)::get(null,get_full_name(),"rgm",rgm);
        if(starting_phase != null)
          starting_phase.raise_objection(this);

#100000;
        write_reg(rgm.Clock_Divide_Register_ins,status,'h4,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("clock divide register value is %0h",4),UVM_LOW)
#1000;
        write_reg(rgm.Interrupt_Enable_Register_ins,status,'h0,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("interrupt enable register value is %0h",0),UVM_LOW)
#1000;       
        write_reg(rgm.Mode_Control_Register_ins,status,8'b11010010,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("mode control register value is %0h",'hd2),UVM_LOW)
#1000;     
        write_reg(rgm.Status_Register_ins,status,'h8,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("status register value is %s",status),UVM_LOW)
#1000;
        write_reg(rgm.Lo_Master_Address_Register_ins,status1,'h12,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status1),UVM_LOW)
#1000;
        write_reg(rgm.Hi_Master_Address_Register_ins,status2,'h0,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status2),UVM_LOW)
#1000;
      //  write_reg(rgm.Master_data_buffer_ins,status3,'h12,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status3),UVM_LOW)
#1000;
        write_reg(rgm.Control_Register_ins,status4,'h3,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status4),UVM_LOW)
#1000;

        read_reg(rgm.Clock_Divide_Register_ins,status,data,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("clock divide register value is %0h",data),UVM_LOW)
#1000;
        read_reg(rgm.Interrupt_Enable_Register_ins,status,data1,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("interrupt enable register value is %0h",data1),UVM_LOW)
#1000;       
        read_reg(rgm.Mode_Control_Register_ins,status,data2,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("mode control register value is %0h",data2),UVM_LOW)
#1000;     
        read_reg(rgm.Status_Register_ins,status,data3,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("status register value is %0h",data3),UVM_LOW)
#1000;
        read_reg(rgm.Lo_Master_Address_Register_ins,status,data4,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("lo slave address register value is %0h",data4),UVM_LOW)
#1000;
        read_reg(rgm.Hi_Master_Address_Register_ins,status,data5,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("hi slave address register value is %0h",data5),UVM_LOW)
#1000;
        //read_reg(rgm.Master_data_buffer_ins,status,data6,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("data buffer register value is %0h",data6),UVM_LOW)
#1000;
        read_reg(rgm.Control_Register_ins,status,data7,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("control register value is %0h",data7),UVM_LOW)
#300000;





        if(starting_phase != null)
            starting_phase.drop_objection(this);

    endtask

    `uvm_object_utils(apb_bus_seq)

endclass
