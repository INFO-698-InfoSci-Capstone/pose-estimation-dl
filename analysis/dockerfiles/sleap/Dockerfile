FROM harbor.cyverse.org/vice/kasm/ubuntu:gpu-20.04-stable

# create ~/data-store for CSI driver fuse mount
WORKDIR /home/kasm-user/data-store

USER root

# Set correct nvidia environment vars
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    wget \
    git \
    vim \
    python3-dev \
    python3-pip \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    filezilla \
    && rm -rf /var/lib/apt/lists/*

COPY kasmvnc_defaults.yaml /usr/share/kasmvnc/kasmvnc_defaults.yaml
COPY vnc_startup.sh /dockerstartup/vnc_startup.sh

# Clean conda and set right privs
RUN conda clean --all -y
ARG LOCAL_USER=kasm-user
RUN chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/miniconda3

# Create necessary directories for desktop shortcuts, set ownership
RUN mkdir -p /home/kasm-user/Desktop && \
    chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/Desktop

RUN mkdir -p /home/kasm-user/shortcut-files && \
    chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/shortcut-files

RUN mkdir -p /home/kasm-user/sleap-notebooks && \
    chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/sleap-notebooks

COPY JUPYTER.yaml /home/kasm-user/data-store/JUPYTER.yaml

# Install nvitop in the base conda environment
RUN /bin/bash -c "source activate base && \
    pip install nvitop"

# Create the conda environment and install SLEAP
RUN mkdir -p /root/.conda && \
    conda config --file /root/.condarc --add channels conda-forge && \
    conda config --file /root/.condarc --add channels nvidia && \
    conda config --file /root/.condarc --add channels sleap/label/dev && \
    conda config --file /root/.condarc --add channels sleap && \
    conda config --file /root/.condarc --add channels anaconda && \
    conda create -y -n sleap -c conda-forge -c nvidia -c sleap/label/dev -c sleap -c anaconda sleap=1.4.1 && \
    conda clean -ya

# Create a conda environment with jupyter using python 3.10
RUN conda env create -f JUPYTER.yaml
RUN conda env update -f JUPYTER.yaml

# Install Jupyter in the base conda environment
#RUN /bin/bash -c "source activate sleap && \
#    conda install -y ipython jupyter nb_conda ffmpeg && \
#    conda install 'notebook<7.0.0'"

# Create desktop shortcut for SLEAP
COPY sleapIcon.png /home/kasm-user/shortcut-files
COPY launch_sleap.sh /home/kasm-user/shortcut-files
RUN sudo chmod +x /home/kasm-user/shortcut-files/launch_sleap.sh

COPY sleap.desktop /home/kasm-user/Desktop
RUN chmod +x /home/kasm-user/Desktop/sleap.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/sleap.desktop

#RUN echo "[Desktop Entry]\nVersion=1.0\nName=SLEAP\nComment=SLEAP Animal Pose Tracking\nExec=bash -c 'source /home/kasm-user/miniconda3/etc/profile.d/conda.sh && conda activate sleap && sleap-label'\nTerminal=false\nType=Application\nIcon=utilities-terminal\nCategories=Science;" > /home/kasm-user/Desktop/sleap.desktop && \
#    chmod +x /home/kasm-user/Desktop/sleap.desktop && \
#    chown ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/Desktop/sleap.desktop

# Create desktop shortcut for Jupyter
COPY jupyterIcon.png /home/kasm-user/shortcut-files
COPY launch_jupyter.sh /home/kasm-user/shortcut-files
RUN sudo chmod +x /home/kasm-user/shortcut-files/launch_jupyter.sh

COPY jupyter.desktop /home/kasm-user/Desktop
RUN sudo chmod +x /home/kasm-user/Desktop/jupyter.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/jupyter.desktop

# Create desktop shortcut for nvitop
COPY nvitopIcon.png /home/kasm-user/shortcut-files
COPY launch_nvitop.sh /home/kasm-user/shortcut-files
RUN sudo chmod +x /home/kasm-user/shortcut-files/launch_nvitop.sh

COPY nvitop.desktop /home/kasm-user/Desktop
RUN sudo chmod +x /home/kasm-user/Desktop/nvitop.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/nvitop.desktop

# Copy the Jupyter notebooks into ~/sleap-notebooks
COPY notebooks/ /home/kasm-user/sleap-notebooks

# Set right permissions
RUN sudo chmod +x /dockerstartup/vnc_startup.sh

#########

ENV CUDA_VISIBLE_DEVICES=0

RUN sudo apt update && sudo apt update

#USER kasm-user

#RUN touch ~/.Xauthority

COPY sleap_instructions.md /home/kasm-user
COPY sleap_open_instructions.desktop /etc/xdg/autostart/ 

RUN unset LD_LIBRARY_PATH

# set right permissions
RUN chmod -R a+rw /home/kasm-user/.cache

ENTRYPOINT [ "/dockerstartup/vnc_startup.sh" ]