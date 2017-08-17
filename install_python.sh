#!/bin/bash

if ! command -v python > /dev/null; then
    echo "Install Python"
    sudo apt-get install -y python-minimal
fi