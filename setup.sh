#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Starting setup script at $(pwd)"

if [ ! -f requirements.txt ]; then
    echo "ERROR: requirements.txt not found!"
    exit 1
fi

echo "Installing transformers library..."
python3 -m pip install transformers

echo "Installing Python dependencies from requirements.txt..."
python3 -m pip install -r requirements.txt --ignore-installed

if [ ! -d ../torch2trt ]; then
    echo "ERROR: ../torch2trt directory not found!"
    exit 1
fi

echo "Installing torch2trt..."
cd ../torch2trt
echo "Running: python3 setup.py install"
python3 setup.py install

if [ ! -d ../nanoowl ]; then
    echo "ERROR: ../nanoowl directory not found!"
    exit 1
fi

echo "Setting up nanoowl in develop mode..."
cd ../nanoowl
echo "Running: python3 setup.py develop --user"
python3 setup.py develop --user

echo "Checking if 'data' directory exists..."
if [ ! -d data ]; then
    echo "'data' directory not found. Creating 'data' directory..."
    mkdir -p data
else
    echo "'data' directory already exists."
fi

ENGINE_PATH="data/owl_image_encoder_patch32.engine"
echo "Checking if '$ENGINE_PATH' exists..."
if [ ! -f "$ENGINE_PATH" ]; then
    echo "'$ENGINE_PATH' not found. Building engine..."
    python3 -m nanoowl.build_image_encoder_engine "$ENGINE_PATH" --onnx_opset=16
else
    echo "'$ENGINE_PATH' already exists."
fi