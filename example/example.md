# Running Merlin-HLS on the atax kernel

This tutorial will go through the necessary process of running Merlin-HLS on an example atax kernel. It will details the settings you need to modify in order to run it on other kernels.

For reference on running AutoDSE and HARP, please refer to their official repo.

For HARP, please check:
```shell
python src/parallel_run_tool_dse.py
```

## Project Directory
```
- atax
  - xilinx_dse
    - Makefile: the Makefile that configure the project
    - atax/: the source file and the design space.
- mcc_common/mcc_common.mk: the common Makefile used by all projects, simplifying calling Merlin and Vitis HLS
```

## Running Merlin (Assuming Vitis HLS installed)
#### Download the container to your local machine:

1. docker
```shell
docker pull ghcr.io/ucla-vast/hls-vast-lab:latest
```

2. apptainer (for slurm cluster)
```shell
apptainer pull hls_vastlab.sif docker://ghcr.io/ucla-vast/hls-vast-lab:latest
```

#### Run the container
1. Set up the Vitis environment: please remember to change the environment variable to your local setting
```shell
export VITIS_VERSION=2021.1

#### change the following variable to your own install path ###
export XILINX_PATH=/opt/xilinx
export VITIS_INSTALL_PATH=$XILINX_PATH/tools
export XRT_INSTALL_PATH=$XILINX_PATH/xrt
###############################################################

source $VITIS_INSTALL_PATH/Vitis/$VITIS_VERSION/settings64.sh
source $VITIS_INSTALL_PATH/Vitis_HLS/$VITIS_VERSION/settings64.sh
source $XRT_INSTALL_PATH/setup.sh
```

2. Modify the project Makefile and general Makefile
There are several places you need to modify the adapt the Makefiles to your own project

- When applying the same Makefile to other programs/kernels, please modify the relative path to the source file.

```shell
# In ./atax/xilinx_dse, line 28
KERNEL_NAME=atax
KERNEL_SRC_FILES=./atax/atax.c
```

- When setting it up on your own local machine, please modify the following two variable in mcc_common/mcc_common.mk

```shell
# In mcc_common/mcc_common.mk, line 8
XILINX_PLATFORM_BASE=/opt/xilinx/platforms
DEVICE=xilinx_u200_xdma_201830_2
```

Note that the default platform used in AutoDSE and HARP is the one specified here.

3. Run the container with proper mounting: Note that the "run.sh" is provided in the same folder as this README, it will setup several more necessary environment variables.
- docker
```shell
docker run -it \
-v $HOME:$HOME \
-v $XILINX_PATH:$XILINX_PATH \
-e XILINX_HLS=$XILINX_HLS \
-e XILINX_VITIS=$XILINX_VITIS \
-e XILINX_VIVADO=$XILINX_VIVADO \
-e XILINX_XRT=$XILINX_XRT \
ghcr.io/ucla-vast/hls-vast-lab:latest bash
source run.sh
```

- apptainer
```shell
apptainer run --bind /home,/opt/xilinx hls_vastlab.sif bash
source run.sh
```

4. Run Merlin and Vitis C-Synth (inside the container)
```shell
cd atax/xilinx_dse
make mcc_estimate
```

You can now check the result with "merlin.log", "merlin.rpt", or the Vitis report in the ".merlin_prj" directory.