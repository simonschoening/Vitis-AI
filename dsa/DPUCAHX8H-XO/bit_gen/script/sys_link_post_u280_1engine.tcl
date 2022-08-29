hbm_memory_subsystem::force_host_port 8 1 [get_bd_cells hmss_0]
hbm_memory_subsystem::force_kernel_port [get_bd_intf_pins /dpu_0/DPU_AXI_0] 0 1 [get_bd_cells hmss_0]
hbm_memory_subsystem::force_kernel_port [get_bd_intf_pins /dpu_0/DPU_AXI_W0] 10 1 [get_bd_cells hmss_0]
hbm_memory_subsystem::force_kernel_port [get_bd_intf_pins /dpu_0/DPU_AXI_W1] 11 1 [get_bd_cells hmss_0]
hbm_memory_subsystem::force_kernel_port [get_bd_intf_pins /dpu_0/DPU_AXI_I0] 16 1 [get_bd_cells hmss_0]

set_param bd.hooks.addr.debug_scoped_use_ms_name true
validate_bd_design -force
