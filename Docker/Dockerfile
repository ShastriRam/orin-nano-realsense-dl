ARG BASE_IMAGE=nvcr.io/nvidia/l4t-base:r36.2.0
FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
		  libssl-dev \
		  libusb-1.0-0-dev \
            libgtk-3-dev \
            libglfw3-dev \
		  libgl1-mesa-dev \
		  libglu1-mesa-dev \
		  qtcreator \
		  udev && \
    if [ $(lsb_release -cs) = "bionic" ]; then \
        apt-get install -y --no-install-recommends python-dev; \
    else \
        apt-get install -y --no-install-recommends python2-dev; \
    fi \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        libunwind-dev \
        libatlas-base-dev \
        libavcodec-dev \
        libavformat-dev \
        libcanberra-gtk3-module \
        libeigen3-dev \
        libglew-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer-plugins-good1.0-dev \
        libgstreamer1.0-dev \
        libgtk-3-dev \
        libjpeg-dev \
        libjpeg8-dev \
        libjpeg-turbo8-dev \
        liblapack-dev \
        libopenblas-dev \
        libpng-dev \
        libpostproc-dev \
        libswscale-dev \
        libtesseract-dev \
        libtiff-dev \
        libv4l-dev \
        libxine2-dev \
        libxvidcore-dev \
        libx264-dev \
        libgtkglext1 \
        libgtkglext1-dev \
        pkg-config \
        qv4l2 \
        v4l-utils \
        zlib1g-dev \
        file \
        tar

RUN apt-get update && apt-get install -y --no-install-recommends python3-pip
RUN pip install pyrealsense2 opencv-python
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE || apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key F6E65AC044F831AC80A06380C8B3A55A6F3EFCDE
RUN apt-get install -y software-properties-common
RUN add-apt-repository "deb https://librealsense.intel.com/Debian/apt-repo jammy main" -u
RUN apt-get install -y librealsense2-utils
RUN apt-get install -y librealsense2-dev

WORKDIR /home