class Master_data_buffer extends uvm_reg;

rand uvm_reg_field Data;

virtual function void build();

    Data=uvm_reg_field::type_id::create("Data");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    Data.configure(this,8,0,"RW",1,0,0,0,1);

endfunction

`uvm_object_utils(Master_data_buffer)

function new(input string name = "Master_data_buffer");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Slave_data_buffer extends uvm_reg;

rand uvm_reg_field Data;

virtual function void build();

    Data=uvm_reg_field::type_id::create("Data");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    Data.configure(this,8,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Slave_data_buffer)

function new(input string name = "Slave_data_buffer");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Lo_Master_Address_Register extends uvm_reg;

rand uvm_reg_field s7_mode;

rand uvm_reg_field t10_mode_lo;

virtual function void build();

    s7_mode=uvm_reg_field::type_id::create("s7_mode");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_mode.configure(this,7,1,"RW",1,0,1,1,0);

    t10_mode_lo=uvm_reg_field::type_id::create("t10_mode_lo");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t10_mode_lo.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Lo_Master_Address_Register)

function new(input string name = "Lo_Master_Address_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Hi_Master_Address_Register extends uvm_reg;

rand uvm_reg_field fixed;

rand uvm_reg_field t10_mode_9_8;

rand uvm_reg_field careless;

virtual function void build();

    fixed=uvm_reg_field::type_id::create("fixed");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    fixed.configure(this,5,3,"RW",1,0,1,1,0);

    t10_mode_9_8=uvm_reg_field::type_id::create("t10_mode_9_8");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t10_mode_9_8.configure(this,2,1,"RW",1,0,1,1,0);

    careless=uvm_reg_field::type_id::create("careless");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    careless.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Hi_Master_Address_Register)

function new(input string name = "Hi_Master_Address_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Control_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Control_Register)

function new(input string name = "Control_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Mode_Control_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Mode_Control_Register)

function new(input string name = "Mode_Control_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Status_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RO",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RO",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RO",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RO",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RO",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RO",1,0,1,1,0);

endfunction

`uvm_object_utils(Status_Register)

function new(input string name = "Status_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Extended_Status_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RO",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RO",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RO",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Extended_Status_Register)

function new(input string name = "Extended_Status_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Lo_Slave_Address_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Lo_Slave_Address_Register)

function new(input string name = "Lo_Slave_Address_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Hi_Slave_Address_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Hi_Slave_Address_Register)

function new(input string name = "Hi_Slave_Address_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Clock_Divide_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Clock_Divide_Register)

function new(input string name = "Clock_Divide_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Interrupt_Enable_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Interrupt_Enable_Register)

function new(input string name = "Interrupt_Enable_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Transfer_Count_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Transfer_Count_Register)

function new(input string name = "Transfer_Count_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Extended_Control_and_Slave_Status_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RO",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RO",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Extended_Control_and_Slave_Status_Register)

function new(input string name = "Extended_Control_and_Slave_Status_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass

class Direct_Control_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Direct_Control_Register)

function new(input string name = "Direct_Control_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass


class Interrupt_Register extends uvm_reg;

rand uvm_reg_field s7_B;

rand uvm_reg_field s6_B;

rand uvm_reg_field f5_B;

rand uvm_reg_field f4_B;

rand uvm_reg_field t2_B;

rand uvm_reg_field s2_B;

rand uvm_reg_field f1_B;

rand uvm_reg_field z0_B;

virtual function void build();

    s7_B=uvm_reg_field::type_id::create("s7_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s7_B.configure(this,1,7,"RW",1,0,1,1,0);

    s6_B=uvm_reg_field::type_id::create("s6_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s6_B.configure(this,1,6,"RW",1,0,1,1,0);

    f5_B=uvm_reg_field::type_id::create("f5_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f5_B.configure(this,1,5,"RW",1,0,1,1,0);

    f4_B=uvm_reg_field::type_id::create("f4_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f4_B.configure(this,1,4,"RW",1,0,1,1,0);

    t2_B=uvm_reg_field::type_id::create("t2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    t2_B.configure(this,1,3,"RW",1,0,1,1,0);

    s2_B=uvm_reg_field::type_id::create("s2_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    s2_B.configure(this,1,2,"RW",1,0,1,1,0);

    f1_B=uvm_reg_field::type_id::create("f1_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    f1_B.configure(this,1,1,"RW",1,0,1,1,0);

    z0_B=uvm_reg_field::type_id::create("z0_B");
    //parameter: parent, size, lsb_pos, access, volatile, reset value, has_reset, is_rand, individually accessible
    z0_B.configure(this,1,0,"RW",1,0,1,1,0);

endfunction

`uvm_object_utils(Interrupt_Register)

function new(input string name = "Interrupt_Register");
    //parameter name size has_coverage
    super.new(name,8,UVM_NO_COVERAGE);
endfunction

endclass


class i2c_reg_model extends uvm_reg_block;
rand Master_data_buffer Master_data_buffer_ins;
rand Slave_data_buffer Slave_data_buffer_ins;
rand Lo_Master_Address_Register Lo_Master_Address_Register_ins;
rand Hi_Master_Address_Register Hi_Master_Address_Register_ins;
rand Control_Register Control_Register_ins;
rand Mode_Control_Register Mode_Control_Register_ins;
rand Status_Register Status_Register_ins;
rand Extended_Status_Register Extended_Status_Register_ins;
rand Lo_Slave_Address_Register Lo_Slave_Address_Register_ins;
rand Hi_Slave_Address_Register Hi_Slave_Address_Register_ins;
rand Clock_Divide_Register Clock_Divide_Register_ins;
rand Interrupt_Enable_Register Interrupt_Enable_Register_ins;
rand Transfer_Count_Register Transfer_Count_Register_ins;
rand Extended_Control_and_Slave_Status_Register Extended_Control_and_Slave_Status_Register_ins;
rand Direct_Control_Register Direct_Control_Register_ins;
rand Interrupt_Register Interrupt_Register_ins;

virtual function void build();

    default_map = create_map("default_map",'h0,4,UVM_BIG_ENDIAN,0);

    Master_data_buffer_ins=Master_data_buffer::type_id::create("Master_data_buffer_ins");
    Master_data_buffer_ins.configure(this,null,"Master_data_buffer_ins");
    Master_data_buffer_ins.build();
   // Master_data_buffer_ins.lock_model();
    default_map.add_reg(Master_data_buffer_ins, 'h0<<2, "RW");

    Slave_data_buffer_ins=Slave_data_buffer::type_id::create("Slave_data_buffer_ins");
    Slave_data_buffer_ins.configure(this,null,"Slave_data_buffer_ins");
    Slave_data_buffer_ins.build();
    //Slave_data_buffer_ins.lock_model();
    default_map.add_reg(Slave_data_buffer_ins, 'h2<<2, "RW");

    Lo_Master_Address_Register_ins=Lo_Master_Address_Register::type_id::create("Lo_Master_Address_Register_ins");
    Lo_Master_Address_Register_ins.configure(this,null,"Lo_Master_Address_Register_ins");
    Lo_Master_Address_Register_ins.build();
    //Lo_Master_Address_Register_ins.lock_model();
    default_map.add_reg(Lo_Master_Address_Register_ins, 'h4<<2, "RW");

    Hi_Master_Address_Register_ins=Hi_Master_Address_Register::type_id::create("Hi_Master_Address_Register_ins");
    Hi_Master_Address_Register_ins.configure(this,null,"Hi_Master_Address_Register_ins");
    Hi_Master_Address_Register_ins.build();
   // Hi_Master_Address_Register_ins.lock_model();
    default_map.add_reg(Hi_Master_Address_Register_ins, 'h5<<2, "RW");

    Control_Register_ins=Control_Register::type_id::create("Control_Register_ins");
    Control_Register_ins.configure(this,null,"Control_Register_ins");
    Control_Register_ins.build();
   // Control_Register_ins.lock_model();
    default_map.add_reg(Control_Register_ins, 'h6<<2, "RW");

    Mode_Control_Register_ins=Mode_Control_Register::type_id::create("Mode_Control_Register_ins");
    Mode_Control_Register_ins.configure(this,null,"Mode_Control_Register_ins");
    Mode_Control_Register_ins.build();
   // Mode_Control_Register_ins.lock_model();
    default_map.add_reg(Mode_Control_Register_ins, 'h7<<2, "RW");

    Status_Register_ins=Status_Register::type_id::create("Status_Register_ins");
    Status_Register_ins.configure(this,null,"Status_Register_ins");
    Status_Register_ins.build();
  //  Status_Register_ins.lock_model();
    default_map.add_reg(Status_Register_ins, 'h8<<2, "RW");

    Extended_Status_Register_ins=Extended_Status_Register::type_id::create("Extended_Status_Register_ins");
    Extended_Status_Register_ins.configure(this,null,"Extended_Status_Register_ins");
    Extended_Status_Register_ins.build();
   // Extended_Status_Register_ins.lock_model();
    default_map.add_reg(Extended_Status_Register_ins, 'h9<<2, "RW");

    Lo_Slave_Address_Register_ins=Lo_Slave_Address_Register::type_id::create("Lo_Slave_Address_Register_ins");
    Lo_Slave_Address_Register_ins.configure(this,null,"Lo_Slave_Address_Register_ins");
    Lo_Slave_Address_Register_ins.build();
  //  Lo_Slave_Address_Register_ins.lock_model();
    default_map.add_reg(Lo_Slave_Address_Register_ins, 'ha<<2, "RW");

    Hi_Slave_Address_Register_ins=Hi_Slave_Address_Register::type_id::create("Hi_Slave_Address_Register_ins");
    Hi_Slave_Address_Register_ins.configure(this,null,"Hi_Slave_Address_Register_ins");
    Hi_Slave_Address_Register_ins.build();
   // Hi_Slave_Address_Register_ins.lock_model();
    default_map.add_reg(Hi_Slave_Address_Register_ins, 'hb<<2, "RW");

    Clock_Divide_Register_ins=Clock_Divide_Register::type_id::create("Clock_Divide_Register_ins");
    Clock_Divide_Register_ins.configure(this,null,"Clock_Divide_Register_ins");
    Clock_Divide_Register_ins.build();
   // Clock_Divide_Register_ins.lock_model();
    default_map.add_reg(Clock_Divide_Register_ins, 'hc<<2, "RW");

    Interrupt_Enable_Register_ins=Interrupt_Enable_Register::type_id::create("Interrupt_Enable_Register_ins");
    Interrupt_Enable_Register_ins.configure(this,null,"Interrupt_Enable_Register_ins");
    Interrupt_Enable_Register_ins.build();
    //Interrupt_Enable_Register_ins.lock_model();
    default_map.add_reg(Interrupt_Enable_Register_ins, 'hd<<2, "RW");

    Transfer_Count_Register_ins=Transfer_Count_Register::type_id::create("Transfer_Count_Register_ins");
    Transfer_Count_Register_ins.configure(this,null,"Transfer_Count_Register_ins");
    Transfer_Count_Register_ins.build();
   // Transfer_Count_Register_ins.lock_model();
    default_map.add_reg(Transfer_Count_Register_ins, 'he<<2, "RW");

    Extended_Control_and_Slave_Status_Register_ins=Extended_Control_and_Slave_Status_Register::type_id::create("Extended_Control_and_Slave_Status_Register_ins");
    Extended_Control_and_Slave_Status_Register_ins.configure(this,null,"Extended_Control_and_Slave_Status_Register_ins");
    Extended_Control_and_Slave_Status_Register_ins.build();
   // Extended_Control_and_Slave_Status_Register_ins.lock_model();
    default_map.add_reg(Extended_Control_and_Slave_Status_Register_ins, 'hf<<2, "RW");

    Direct_Control_Register_ins=Direct_Control_Register::type_id::create("Direct_Control_Register_ins");
    Direct_Control_Register_ins.configure(this,null,"Direct_Control_Register_ins");
    Direct_Control_Register_ins.build();
    //Direct_Control_Register_ins.lock_model();
    default_map.add_reg(Direct_Control_Register_ins, 'h10<<2, "RW");

    Interrupt_Register_ins=Interrupt_Register::type_id::create("Interrupt_Register_ins");
    Interrupt_Register_ins.configure(this,null,"Interrupt_Register_ins");
    Interrupt_Register_ins.build();
   // Interrupt_Register_ins.lock_model();
    default_map.add_reg(Interrupt_Register_ins, 'h11<<2, "RW");


endfunction

`uvm_object_utils(i2c_reg_model)

function new(input string name="i2c_reg_model");
    super.new(name,UVM_NO_COVERAGE);
endfunction

endclass
