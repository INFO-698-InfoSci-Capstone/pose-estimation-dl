# Use kasmweb's preconfigured desktop environment base image
FROM kasmweb/ubuntu-jammy-desktop:1.16.0
USER root
# LABEL org.opencontainers.image.source="https://github.com/info-698-infosci-capstone/pose-estimation-dl"

# Set home and necessary environment variables
ENV HOME=/home/kasm-user
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
WORKDIR $HOME

###### Customize the container Here ######
# Set non-interactive mode for apt and install system dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    wget \
    git \
    vim \
    build-essential \
    python3-dev \
    python3-pip \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    libxcb-cursor0 \
    libpcre2-32-0 \
    && rm -rf /var/lib/apt/lists/*

# Set the default shell to bash...
RUN ln -sf /bin/bash /bin/sh
# Set add bashrc to bash terminal...
RUN echo "[[ -f ~/.bashrc ]] && source ~/.bashrc" >> ~/.bash_profile
RUN echo "[[ -f ~/.bashrc ]] && source ~/.bashrc" >> ~/.profile

# Install Miniconda into /opt/conda
ENV CONDA_DIR=/opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p ${CONDA_DIR} && \
    rm /tmp/miniconda.sh

# Conda will now be automatically activated on all environments.
RUN source "${CONDA_DIR}/bin/activate" && \
    conda init --all

# Create necessary directories for SLEAP data and desktop shortcuts, set ownership
RUN mkdir -p /home/kasm-user/sleap-data /home/kasm-user/Desktop && \
    chown -R 1000:1000 /home/kasm-user/sleap-data /home/kasm-user/Desktop

# Create the conda environment and install SLEAP
RUN source "${CONDA_DIR}/bin/activate" && \
    mkdir -p /root/.conda && \
    conda create -y -n sleap pip python=3.10 cudatoolkit=11.2 cudnn=8.1.0 -c conda-forge -c nvidia && \
    conda clean -ya

# Install Jupyter Notebook and Lab in the sleap environment
RUN source "${CONDA_DIR}/bin/activate" && \
    conda activate sleap && \
    pip install --upgrade notebook jupyterlab jupyter-server-proxy setuptools wheel pip && \
    pip install sleap[pypi]==1.4.1 && \
    pip uninstall -y PySide2 && \
    pip install "PySide6<6.3" && \
    pip install -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-22.04 wxPython && \
    pip install diplomat-track 'numpy<1.25'

# Set up LD_LIBRARY_PATH for GPU libraries in the sleap environment
#RUN mkdir -p ${CONDA_DIR}/envs/sleap/etc/conda/activate.d && \
#    echo '#!/bin/sh' > ${CONDA_DIR}/envs/sleap/etc/conda/activate.d/sleap_activate.sh && \
#    echo 'export SLEAP_OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH' >> ${CONDA_DIR}/envs/sleap/etc/conda/activate.d/sleap_activate.sh && \
#    echo 'export LD_LIBRARY_PATH=${CONDA_DIR}/envs/sleap/lib:$LD_LIBRARY_PATH' >> ${CONDA_DIR}/envs/sleap/etc/conda/activate.d/sleap_activate.sh && \
#    chmod +x ${CONDA_DIR}/envs/sleap/etc/conda/activate.d/sleap_activate.sh

# Create desktop shortcut for launching SLEAP
RUN echo -e "[Desktop Entry]\nVersion=1.0\nName=SLEAP\nComment=SLEAP Animal Pose Tracking\nExec=bash -ci 'cd /home/kasm-user/sleap-data && sleap-label'\nTerminal=false\nType=Application\nIcon=utilities-terminal\nCategories=Science;" \
    > /home/kasm-user/Desktop/sleap.desktop && \
    chmod +x /home/kasm-user/Desktop/sleap.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/sleap.desktop

# Create desktop shortcut for launching Jupyter Lab (internal access only)
RUN echo -e "[Desktop Entry]\nVersion=1.0\nName=Jupyter Lab\nComment=Launch Jupyter Lab for data analysis\nExec=bash -ci 'nohup jupyter lab --ip=127.0.0.1 --port=8888 --no-browser --allow-root --NotebookApp.token=\"\" >/home/kasm-user/jupyter.log 2>&1 & sleep 1 && firefox http://127.0.0.1:8888'\nTerminal=false\nType=Application\nIcon=firefox\nCategories=Science;" \
    > /home/kasm-user/Desktop/jupyter.desktop && \
    chmod +x /home/kasm-user/Desktop/jupyter.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/jupyter.desktop

# Configure user directories, permissions, and file caches
RUN mkdir -p /home/kasm-user/.cache/mozilla /home/kasm-user/.cache/sessions /home/kasm-user/.cache/dconf /home/kasm-user/.config /home/kasm-user/.local/share && \
    chown -R 1000:1000 /home/kasm-user/.cache /home/kasm-user/.config /home/kasm-user/.local && \
    chmod -R 755 /home/kasm-user/.cache /home/kasm-user/.config /home/kasm-user/.local

# Ensure the home directory is set correctly and owned by the correct user
RUN chown 1000:0 $HOME && mkdir -p $HOME && chown -R 1000:0 $HOME
# Some sleap deps try modifying install folders, so we just give it user permissions...
RUN chown 1000:0 -R /opt/conda

# Expose the VNC desktop port only (Jupyter remains internal)
EXPOSE 6901
# Enable GPU Passthrough Features...
ENV NVIDIA_DRIVER_CAPABILITIES=all
# Needed as conda doesn't add library paths for us, this is where tensorflow looks...
ENV LD_LIBRARY_PATH=$CONDA_DIR/envs/sleap/lib:$LD_LIBRARY_PATH
# Automatically activate sleap environment when opening a terminal...
RUN echo -e '$(command -v conda &>/dev/null) && conda activate sleap' >> ~/.bashrc
# Make directory for volume used for persistence and sharing data between host...
RUN mkdir -p /home/kasm-user/sleap-data

USER 1000
CMD ["--tail-log"]
