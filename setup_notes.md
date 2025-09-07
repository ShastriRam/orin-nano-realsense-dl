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

## Install `apt-utils`

`sudo apt-get update && sudo apt-get install apt-utils`

