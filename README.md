```
______  _____ _____    __             _   _  _      _____ 
|  _  \/  ___|  ___|  / _|           | | | || |    /  ___|
| | | |\ `--.| |__   | |_ ___  _ __  | |_| || |    \ `--. 
| | | | `--. \  __|  |  _/ _ \| '__| |  _  || |     `--. \
| |/ / /\__/ / |___  | || (_) | |    | | | || |____/\__/ /
|___/  \____/\____/  |_| \___/|_|    \_| |_/\_____/\____/ 
```                                                      
                                                          
# DSE-for-HLS

## Software

This Docker container contains the following software:

- [Merlin-UCLA](https://github.com/UCLA-VAST/Merlin-UCLA)
- [AutoDSE](https://github.com/UCLA-VAST/AutoDSE)
- [HARP](https://github.com/UCLA-VAST/HARP)

## Software Dependencies

### Docker

Please install [Docker](https://docs.docker.com/engine/install/).

### Install AMD/Xilinx HLS

Please install [Vitis](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vitis.html).

Ensure that you have 300 GB of free space on your device.

## Pull the container

```sh
docker pull ghcr.io/ucla-vast/hls-vast-lab:latest
```

## Connect to the container

```sh
docker run -it ghcr.io/ucla-vast/hls-vast-lab:latest
```

You can share your home directory with the container by adding the `-v` flag:

```sh
docker run -it -v $HOME:$HOME ghcr.io/ucla-vast/hls-vast-lab:latest
```

And you need to share the folder containing the Vitis installation with the container:

```sh
docker run -it -v $HOME:$HOME -v /path/to/vitis:/path/to/vitis ghcr.io/ucla-vast/hls-vast-lab:latest
```

## Software Usage

Please refer to the documentations of [Merlin-UCLA](https://github.com/UCLA-VAST/Merlin-UCLA), [AutoDSE](https://github.com/UCLA-VAST/AutoDSE) and [HARP](https://github.com/UCLA-VAST/HARP).


## DS Generator

The DS Generator is a tool that generates C/C++ files and JSON files for AutoDSE and HARP.

```sh
docker pull ghcr.io/ucla-vast/ds_generator:latest
```

To run:

```sh
docker run -v $(pwd):$(pwd) -w $(pwd) -it ghcr.io/ucla-vast/ds_generator:latest ds_generator *.c
```