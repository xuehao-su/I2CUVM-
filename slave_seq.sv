class slave_seq extends uvm_reg_sequence;

    apb_trans apb_tr;
    i2c_reg_model slave_rgm;

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
        uvm_config_db#(i2c_reg_model)::get(null,get_full_name(),"slave_rgm",slave_rgm);
        if(starting_phase != null)
          starting_phase.raise_objection(this);

#30000;
        write_reg(slave_rgm.Clock_Divide_Register_ins,status,'h4,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("clock divide register value is %0h",4),UVM_LOW)
#1000;
        write_reg(slave_rgm.Interrupt_Enable_Register_ins,status,'h0,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("interrupt enable register value is %0h",0),UVM_LOW)
#1000;       
        write_reg(slave_rgm.Lo_Slave_Address_Register_ins,status1,'h12,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status1),UVM_LOW)
#1000;
        write_reg(slave_rgm.Hi_Slave_Address_Register_ins,status2,'h0,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status2),UVM_LOW)
#1000;
        write_reg(slave_rgm.Mode_Control_Register_ins,status,'hdb,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("mode control register value is %0h",'hd2),UVM_LOW)
#1000;     
        write_reg(slave_rgm.Status_Register_ins,status,'h8,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("status register value is %s",status),UVM_LOW)
#1000;
        write_reg(slave_rgm.Slave_data_buffer_ins,status3,'h12,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status3),UVM_LOW)
#1000;
       // write_reg(slave_rgm.Control_Register_ins,status4,'h3,UVM_FRONTDOOR);
//`uvm_info("case0", $sformatf("status register value is %s",status4),UVM_LOW)
#1000;

        //read_reg(slave_rgm.Clock_Divide_Register_ins,status,data,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("clock divide register value is %0h",data),UVM_LOW)
#1000;
        //read_reg(slave_rgm.Interrupt_Enable_Register_ins,status,data1,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("interrupt enable register value is %0h",data1),UVM_LOW)
#1000;       
        //read_reg(slave_rgm.Mode_Control_Register_ins,status,data2,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("mode control register value is %0h",data2),UVM_LOW)
#1000;     
        //read_reg(slave_rgm.Status_Register_ins,status,data3,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("status register value is %0h",data3),UVM_LOW)
#1000;
        //read_reg(slave_rgm.Lo_Master_Address_Register_ins,status,data4,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("lo slave address register value is %0h",data4),UVM_LOW)
#1000;
        //read_reg(slave_rgm.Hi_Master_Address_Register_ins,status,data5,UVM_FRONTDOOR);
       // `uvm_info("case0", $sformatf("hi slave address register value is %0h",data5),UVM_LOW)
#1000;
        //read_reg(slave_rgm.Master_data_buffer_ins,status,data6,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("data buffer register value is %0h",data6),UVM_LOW)
#1000;
        //read_reg(slave_rgm.Control_Register_ins,status,data7,UVM_FRONTDOOR);
        //`uvm_info("case0", $sformatf("control register value is %0h",data7),UVM_LOW)
#10000;





        if(starting_phase != null)
            starting_phase.drop_objection(this);

    endtask

    `uvm_object_utils(slave_seq)

endclass
