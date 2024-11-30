#!/bin/bash 
set -x
set -e
# loging to HF
huggingface-cli login --token ${HF_TOKEN}
# install dependencies specified in setup.py
python3 setup.py install
if [[ $1 == "--compress" ]]; then
	rm -rf $OUTPUT_MODEL/*
	cd compression
	python3 compress.py
fi
echo "BUILD SUCCESSFUL"
