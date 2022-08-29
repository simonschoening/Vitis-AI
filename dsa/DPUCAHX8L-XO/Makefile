SHELL :=/bin/csh

#ACLK_FREQ can be: 300/275/250
ACLK_FREQ_1CORE ?= 300
ACLK_FREQ_2CORE ?= 250

release_DPUCAHX8L_A_xo:xo_release/VB_0GB/script/package_kernel.tcl xo_release/VB_0GB/src/kernel_DPUCAHX8L_A.xml DPUCAHX8L_A_SRC/DPU
	@ echo "packaging DPUCAHX8L_A XO-IP ..."
	cd xo_release/VB_0GB &&\
	if(-f "DPUCAHX8L_A.xo")rm -rf DPUCAHX8L_A.xo && \
	vivado -source ./script/package_kernel.tcl -mode tcl  -log ./log/vivado.log -jou ./log/vivado.jou -tclargs ./src/DPUCAHX8L_A.v $(ACLK_FREQ_1CORE)

release_DPUCAHX8L_B_xo:xo_release/VB_2GB/script/package_kernel.tcl xo_release/VB_2GB/src/kernel_DPUCAHX8L_B.xml DPUCAHX8L_B_SRC/DPU
	@ echo "packaging DPUCAHX8L_B XO-IP ..."
	cd xo_release/VB_2GB && \
	if(-f "DPUCAHX8L_B.xo")rm -rf DPUCAHX8L_B.xo &&\
	vivado -source ./script/package_kernel.tcl -mode tcl  -log ./log/vivado.log -jou ./log/vivado.jou -tclargs ./src/DPUCAHX8L_B.v $(ACLK_FREQ_1CORE)

release_DPUCAHX8L_A_250_xo:xo_release/VB_0GB/script/package_kernel.tcl xo_release/VB_0GB/src/kernel_DPUCAHX8L_A.xml DPUCAHX8L_A_SRC/DPU
	@ echo "packaging DPUCAHX8L_A 250 Mhz XO-IP ..."
	cd xo_release/VB_0GB &&\
	if(-f "DPUCAHX8L_A.xo")rm -rf DPUCAHX8L_A.xo && \
	vivado -source ./script/package_kernel.tcl -mode tcl  -log ./log/vivado.log -jou ./log/vivado.jou -tclargs ./src/DPUCAHX8L_A.v $(ACLK_FREQ_2CORE)

release_DPUCAHX8L_B_250_xo:xo_release/VB_2GB/script/package_kernel.tcl xo_release/VB_2GB/src/kernel_DPUCAHX8L_B.xml DPUCAHX8L_B_SRC/DPU
	@ echo "packaging DPUCAHX8L_B 250 Mhz XO-IP ..."
	cd xo_release/VB_2GB && \
	if(-f "DPUCAHX8L_B.xo")rm -rf DPUCAHX8L_B.xo &&\
	vivado -source ./script/package_kernel.tcl -mode tcl  -log ./log/vivado.log -jou ./log/vivado.jou -tclargs ./src/DPUCAHX8L_B.v $(ACLK_FREQ_2CORE)

u280_1core: release_DPUCAHX8L_A_xo
	@ echo "Generating xclbin on u280 with single core ..."
	cd ./bit_gen/; v++ -t hw --platform xilinx_u280_xdma_201920_3 --save-temps --temp_dir $@_imp -l --config "./script/cons_$@.ini" -o $@.xclbin ../xo_release/VB_0GB/DPUCAHX8L_A.xo

u280_2core: release_DPUCAHX8L_A_250_xo release_DPUCAHX8L_B_250_xo
	@ echo "Generating xclbin on u280 with tow cores ..."
	cd ./bit_gen/; v++ -t hw --platform xilinx_u280_xdma_201920_3 --save-temps --temp_dir $@_imp -l --config "./script/cons_$@.ini" -o $@.xclbin ../xo_release/VB_0GB/DPUCAHX8L_A.xo ../xo_release/VB_2GB/DPUCAHX8L_B.xo