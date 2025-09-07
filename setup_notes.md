# Setup Notes

## CUDA

To install Jetpack Cuda: `sudo apt install nvidia-cuda`

## Adding System Packages to venv

Use the `--system-site-packages` when running with `venv`

## Chromium

Chromium won't work due to some issues with snapd. The following will fix it. 
```shell
snap download snapd --revision=24724
sudo snap ack snapd_24724.assert
sudo snap install snapd_24724.snap
sudo snap refresh --hold snapd
```

More details can be found in the [Jetson Hacks article](https://jetsonhacks.com/2025/07/12/why-chromium-suddenly-broke-on-jetson-orin-and-how-to-bring-it-back/)

## Install `apt-utils`

`sudo apt-get update && sudo apt-get install apt-utils`

## Install tenorrt

`sudo apt update && apt install nvidia-tensorrt`

