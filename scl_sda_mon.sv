class scl_sda_mon extends uvm_monitor;
    virtual i2c_if scl_sda;
    virtual i2c_if slave;
    virtual PAD_if pad;
    bit[7:0] m_data;
    bit      ack;
    bit[4:0] cur_state;

    bit[4:0] next_state;

    localparam          IDLE   =   5'b00001;
    localparam          START  =   5'b00010;
    localparam          FIRST  =   5'b00100;
    localparam          TRANS  =   5'b01000;
    localparam          STOP   =   5'b10000;
               

    `uvm_component_utils(scl_sda_mon)

    function new(string name="scl_sda_mon", uvm_component parent = null);
        super.new(name,parent);
    endfunction


    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual i2c_if)::get(this,"","scl_sda",scl_sda))
            `uvm_fatal("scl_sda_mon","virtual interface for i2c_if must be set")

        if(!uvm_config_db#(virtual i2c_if)::get(this,"","slave",slave))
            `uvm_fatal("scl_sda_mon","virtual interface for i2c_if must be set")

        if(!uvm_config_db#(virtual PAD_if)::get(this,"","pad",pad))
            `uvm_fatal("scl_sda_mon","virtual interface for PAD_if must be set")
    endfunction

task state_machine();

@(posedge scl_sda.i2c_core_clk) cur_state <= next_state;
@(cur_state) 
case(cur_state)


IDLE:begin

    `uvm_info("i2c bus mon","current state is idle",UVM_LOW)
    start_detect();
    next_state <= START;

end

START:begin
 
    `uvm_info("i2c bus mon","current state is start",UVM_LOW)
    next_state <= FIRST;

end


FIRST:begin

    `uvm_info("i2c bus mon","current state is first byte",UVM_LOW)
    receive_8bits();
    next_state <= TRANS;
    check_ack();
end


TRANS:begin
  
    //fork begin
        `uvm_info("i2c bus mon","current state is trans",UVM_LOW)
        fork 
        begin
        receive_8bits();
        check_ack();
        next_state <= TRANS;
        end
        begin
        stop_detect();
        next_state <= STOP;
        end
        join_any
        
    //end
    //join
end


STOP:begin
    `uvm_info("i2c bus mon","current state is stop",UVM_LOW)
    next_state <= IDLE;


end

default:begin
    `uvm_info("i2c bus mon","current state is default",UVM_LOW)
    next_state <= IDLE;
end

endcase

endtask


    task run_phase(uvm_phase phase);
        cur_state <= IDLE;
        while(1) begin
        #1  state_machine();
        end       
    endtask
   

    task receive_8bits();
        for(int i=7;i>=0;i--)begin
            @(posedge pad.scl) m_data[i] = pad.sda;
            @(negedge pad.scl);
        end

        `uvm_info("scl_sda_mon",$sformatf("receive 8 bits %0h",m_data),UVM_LOW)
    endtask

   
    task start_detect();
        bit start_detected = 1'b0;
        bit sda_on = 1'b0;    
        while(start_detected == 1'b0)begin
           @(negedge pad.sda);        
           sda_on = 1'b1;
           if(pad.scl == 1'b1 &&sda_on)begin
               start_detected = 1'b1;
           end
        end
        `uvm_info("scl_sda_mon","start detected",UVM_LOW)
    endtask



    task stop_detect();
        bit stop_detected = 1'b0;
        bit sda_on = 1'b0;
        
        while(stop_detected == 1'b0)begin
            @(posedge pad.sda);
            sda_on = 1'b1;
           if(pad.scl == 1'b1 &&sda_on)begin
               stop_detected = 1'b1;
           end
        end
        `uvm_info("scl_sda_mon","stop detected",UVM_LOW)
    endtask

    task check_ack();

        @(posedge pad.scl) ack = slave.sda_o;

        @(negedge pad.scl)

        `uvm_info("i2c bus mon", $sformatf("ack bit is %h",ack),UVM_LOW)

        if(ack == 1) `uvm_info("i2c bus mon", "slv throws nack",UVM_LOW)
        else begin
             `uvm_info("i2c bus mon", "ack is received",UVM_LOW)
        end
    endtask



endclass
