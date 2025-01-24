#!/bin/bash

# SPDX-FileCopyrightText: 2025 OTH Regensburg, Nicole Hoess <nicole.hoess@othr.de>
# SPDX-License-Identifier: GPL-2.0-only

source /home/saner/.bashrc
eval "$(/home/saner/anaconda3/bin/conda shell.bash hook)"

conda create --name saner python=3.10 pip -y
eval "$(/home/saner/anaconda3/bin/conda shell.bash hook)"

conda activate saner
pip install -r /home/saner/src/requirements.txt
Rscript /home/saner/plot/packages.R

