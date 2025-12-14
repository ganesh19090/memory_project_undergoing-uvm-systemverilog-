//class mem_err_test
class mem_err_tx extends mem_tx;
rand int err_count;

//factory and field registration 
`uvm_object_utils_begin(mem_err_tx)
`uvm_field_int(err_count,UVM_ALL_ON)
`uvm_object_utils_end

//new constructor
function new(string name="");
super.new(name);
endfunction

constraint err_count1{
err_count inside {[10:20]};
}
endclass
