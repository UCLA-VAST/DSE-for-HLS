#!/bin/bash

export VITIS_PYTHON_27_LIBRARY_PATH="$XILINX_VITIS/aietools/tps/lnx64/target_aie_ml/chessdir/python-2.7.13/lib"
export C_INCLUDE_PATH="$XILINX_HLS/lnx64/tools/gcc/lib/gcc/x86_64-unknown-linux-gnu/4.6.3/include/:$C_INCLUDE_PATH" 
export C_INCLUDE_PATH="$XILINX_HLS/include/:$C_INCLUDE_PATH" 
export C_INCLUDE_PATH="/opt/merlin/sources/merlin-compiler/trunk/source-opt/include/apint_include/:$C_INCLUDE_PATH" 
export C_INCLUDE_PATH="$XILINX_HLS/include:$C_INCLUDE_PATH"

export PATH=$XILINX_XRT/bin:$PATH
export PATH=$XILINX_VIVADO/bin:$PATH
export PATH=$XILINX_VITIS/bin:$XILINX_VITIS/runtime/bin:$PATH
export PATH=$XILINX_HLS/bin:$PATH
# make sure it find python 2.7 first
export PATH=/usr/bin:$PATH