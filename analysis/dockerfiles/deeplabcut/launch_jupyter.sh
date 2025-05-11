#!/bin/bash                                                                     
{
source /home/kasm-user/miniconda3/etc/profile.d/conda.sh
conda init
source /home/kasm-user/.bashrc
conda activate DEEPLABCUT
cd /home/kasm-user/deeplabcut-notebooks
} > /dev/null 2>&1
jupyter notebook