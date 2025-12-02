#compile
vlog list.svh +incdir+C:/Users/91935/Desktop/uvm-1.2/src
#elaboration
vsim -novopt -suppress 12110 top \
-sv_lib C:/questasim64_10.7c/uvm-1.2/win64/uvm_dpi
#add wave

#run
run -all
