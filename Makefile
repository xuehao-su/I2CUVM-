UVM_HOME = /tools/UVM/sv
	
all:clean compile run
	
compile:
	$(VCS) i2c_top.sv
	
run:
	$(SIMV)
	
VCS =	vcs -sverilog -timescale=1ns/1ns \
    -debug_all\
    +acc +vpi\
    +define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
    +incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
    $(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS
    
SIMV =	./simv +UVM_VERBOSITY=$(UVM_VERBOSITY) -l vcs.log

URG =	urg -format text -dir simv.vdb

CHECK = \
    @$(TEST)\(`grep -c'UVM_ERROR: $(N_ERRS)'vcs.log` -eq 1\)-a\
      \(`grep -c 'UVM_FATAL: $(N_FATALS)'vcs.log` -eq 1\)
      	
clean:
	rm -rf *~ core csrc simv* vc_hdrs.h ucli.key urg* *.log
  	
dve:
	dve&
