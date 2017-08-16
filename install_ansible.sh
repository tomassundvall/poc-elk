#!/bin/bash

if ! command -v ansible > /dev/null; then
    echo "Install Ansible dependencies and Git"
    sudo apt-get install -y -qq git python-yaml python-pip build-essential libssl-dev libffi-dev python-dev
    pip install --upgrade pip
    pip install paramiko pyyaml jinja2 markupsafe
    pip install ansible
fi
