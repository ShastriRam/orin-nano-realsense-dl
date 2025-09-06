xhost +si:localuser:$(id -un)
xhost +si:localuser:root

export XSOCK=/tmp/.X11-unix
export XAUTH=$HOME/.Xauthority
[ -f "$XAUTH" ] || touch "$XAUTH"

docker run --rm -it \
  --runtime nvidia \
  --privileged \
  --network host \
  -e DISPLAY=$DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -v $XSOCK:$XSOCK:rw \
  -v $XAUTH:/root/.Xauthority:ro \
  -v /dev/bus/usb:/dev/bus/usb \
  -v ../librealsense:/home/librealsense \
  realsense_dl:latest