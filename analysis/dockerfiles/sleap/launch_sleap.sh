#!/bin/bash                                                                     
{
source /home/kasm-user/miniconda3/etc/profile.d/conda.sh
conda init
source /home/kasm-user/.bashrc
conda activate sleap
} > /dev/null 2>&1
sleap-label