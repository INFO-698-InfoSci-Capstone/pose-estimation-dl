FROM harbor.cyverse.org/vice/kasm/ubuntu:gpu-20.04-stable

# create ~/data-store for CSI driver fuse mount
WORKDIR /home/kasm-user/data-store

USER root

# Set correct pytorch/nvidia environment vars
ENV PYTORCH_NVML_BASED_CUDA_CHECK=1
ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=compute,utility

COPY kasmvnc_defaults.yaml /usr/share/kasmvnc/kasmvnc_defaults.yaml
COPY vnc_startup.sh /dockerstartup/vnc_startup.sh

# Clean conda and set right privs
RUN conda clean --all -y
ARG LOCAL_USER=kasm-user
RUN chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/miniconda3

# Set right permissions
RUN sudo chmod +x /dockerstartup/vnc_startup.sh

#########

# Create necessary directories for desktop shortcuts, set ownership
RUN mkdir -p /home/kasm-user/Desktop && \
    chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/Desktop

RUN mkdir -p /home/kasm-user/shortcut-files && \
    chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/shortcut-files

RUN mkdir -p /home/kasm-user/deeplabcut-notebooks && \
    chown -R ${LOCAL_USER}:${LOCAL_USER} /home/kasm-user/deeplabcut-notebooks

COPY DEEPLABCUT.yaml /home/kasm-user/data-store/DEEPLABCUT.yaml

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
    
# Install filezilla
RUN apt-get update && apt-get install -y filezilla && rm -rf /var/lib/apt/lists/*

# Create the DEEPLABCUT environment
RUN conda env create -f DEEPLABCUT.yaml
RUN conda env update -f DEEPLABCUT.yaml

RUN /bin/bash -c "source activate DEEPLABCUT && \
    pip install --force-reinstall --no-deps shiboken6==6.8.0.2 && \
    conda install pyside6 -c conda-forge -y"

# Install nvitop into the base conda environment
RUN /bin/bash -c "source activate base && \
    pip install nvitop"

# Create desktop shortcut for DEEPLABCUT
COPY deeplabcutIcon.png /home/kasm-user/shortcut-files
COPY launch_deeplabcut.sh /home/kasm-user/shortcut-files
RUN sudo chmod +x /home/kasm-user/shortcut-files/launch_deeplabcut.sh

COPY deeplabcut.desktop /home/kasm-user/Desktop
RUN sudo chmod +x /home/kasm-user/Desktop/deeplabcut.desktop && \
    chown 1000:1000 /home/kasm-user/Desktop/deeplabcut.desktop

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

# Copy the Jupyter notebooks into ~/deeplabcut-notebooks
COPY notebooks/ /home/kasm-user/deeplabcut-notebooks

# Ensure the environment is activated in the shell session
SHELL ["conda", "run", "-n", "DEEPLABCUT", "/bin/bash", "-c"]

ENV CUDA_VISIBLE_DEVICES=0

RUN sudo apt update && sudo apt update

#USER kasm-user

#RUN touch ~/.Xauthority

COPY deeplabcut_instructions.md /home/kasm-user
COPY deeplabcut_open_instructions.desktop /etc/xdg/autostart/

RUN unset LD_LIBRARY_PATH

# set right permissions
RUN chmod -R a+rw /home/kasm-user/.cache

ENTRYPOINT [ "/dockerstartup/vnc_startup.sh" ]