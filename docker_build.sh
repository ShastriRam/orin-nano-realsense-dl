
docker build --build-arg BASE_IMAGE=nvcr.io/nvidia/l4t-base:r36.2.0 \
  -t realsense_dl:latest -f ./Docker/Dockerfile .