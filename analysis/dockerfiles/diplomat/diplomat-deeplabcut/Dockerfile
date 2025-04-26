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


# Create necessary directories for DLC data and desktop shortcuts, set ownership
RUN mkdir -p /home/kasm-user/dlc-data /home/kasm-user/Desktop && \
    chown -R 1000:1000 /home/kasm-user/dlc-data /home/kasm-user/Desktop

# Create the conda environment and install DeepLabCut
# Here we use channels conda-forge, nvidia, and anaconda.
RUN source "${CONDA_DIR}/bin/activate" && \
    mkdir -p /root/.conda && \
    conda create -y -n dlc python=3.10 cudatoolkit=11.2 cudnn=8.1.0 -c conda-forge -c nvidia && \
    conda clean -ya

# Install Jupyter Notebook and Lab in the dlc environment
RUN source "${CONDA_DIR}/bin/activate" && \
    conda activate dlc && \ 
    pip install notebook jupyterlab jupyter-server-proxy "deeplabcut[gui, tf]" && \
    pip install "PySide6<6.3" && \
    pip install -f https://extras.wxpython.org/wxPython4/extras/linux/gtk3/ubuntu-22.04 wxPython && \
    pip install diplomat-track "numpy>1.23"

# Create desktop shortcut for launching DeepLabCut GUI
# Here, we assume that running
#   python -c "import deeplabcut; deeplabcut.launch_dlc()"
# brings up the DeepLabCut GUI.
RUN echo -e "[Desktop Entry]\nVersion=1.0\nName=DeepLabCut\nComment=DeepLabCut Animal Pose Labeling\nExec=bash -ci 'conda activate dlc && python -m deeplabcut'\nTerminal=false\nType=Application\nIcon=utilities-terminal\nCategories=Science;" \
    > /home/kasm-user/Desktop/dlc.desktop && \
    chmod +x /home/kasm-user/Desktop/dlc.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/dlc.desktop

# Create desktop shortcut for launching Jupyter Lab (internal access only)
RUN echo -e "[Desktop Entry]\nVersion=1.0\nName=Jupyter Lab\nComment=Launch Jupyter Lab for data analysis\nExec=bash -ci 'conda activate dlc && nohup jupyter lab --ip=127.0.0.1 --port=8888 --no-browser --allow-root --NotebookApp.token=\"\" >/home/kasm-user/jupyter.log 2>&1 & sleep 1 && firefox http://127.0.0.1:8888'\nTerminal=false\nType=Application\nIcon=firefox\nCategories=Science;" \
    > /home/kasm-user/Desktop/jupyter.desktop && \
    chmod +x /home/kasm-user/Desktop/jupyter.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/jupyter.desktop

# Configure user directories, permissions, and file caches
RUN mkdir -p /home/kasm-user/.cache/mozilla /home/kasm-user/.cache/sessions /home/kasm-user/.cache/dconf /home/kasm-user/.config /home/kasm-user/.local/share && \
    chown -R 1000:1000 /home/kasm-user/.cache /home/kasm-user/.config /home/kasm-user/.local && \
    chmod -R 755 /home/kasm-user/.cache /home/kasm-user/.config /home/kasm-user/.local

# Ensure the home directory is set correctly and owned by the correct user
RUN chown 1000:0 $HOME && mkdir -p $HOME && chown -R 1000:0 $HOME

# Expose the VNC desktop port only (Jupyter remains internal)
EXPOSE 6901
# Needed as conda doesn't add library paths for us, this is where tensorflow looks...
ENV LD_LIBRARY_PATH=$CONDA_DIR/envs/dlc/lib:$LD_LIBRARY_PATH
# Enable GPU Passthrough Features...
ENV NVIDIA_DRIVER_CAPABILITIES=all
# Automatically activate sleap environment when opening a terminal...
RUN echo -e '$(command -v conda &>/dev/null) && conda activate dlc' >> ~/.bashrc
# Make directory for volume used for persistence and sharing data between host...
RUN mkdir -p /home/kasm-user/dlc-data

USER 1000
CMD ["--tail-log"]

