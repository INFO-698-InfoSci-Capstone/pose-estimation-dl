# Installing DeepLabCut and SLEAP into a Jetstream instance
## Conda installation

1. Add conda

```
wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
```

2. Set the permissions of miniconda.sh to read, write, and execute

```
sudo chmod 777 miniconda.sh
```

3. Install conda in /home/exouser

```
~/miniconda.sh -b -p /home/exouser/miniconda3
```

5. Add conda to path

```
export PATH=/home/exouser/miniconda3/bin:$PATH
```

4. Initialize conda

```
conda init
```

5. Restart the terminal

```
 source ~/.bashrc
```

6. Activate the base conda environment

```
 conda activate base
```

7. Install conda dependencies

```
conda install -c conda-forge mamba -y
```

## Add other installations

1. Install nvitop to monitor GPU usage

```
pip install nvitop
```

2. Install Filezilla

```
sudo apt update
sudo apt install filezilla -y
```
 - Confirm installation with ```filezilla &```
 - Drag it's desktop icon into the pinned apps on the dock

## Create Desktop shortcuts for SLEAP and DeepLabCut

### SLEAP Desktop shortcut

1. Download the SLEAP icon from https://sleap.ai/installation.html
    - Open the side menu on the left and download the image
    - Save the image as sleapIcon.png

2. Create a launch_sleap.sh file

```
nano ~/launch_sleap.sh
```

3. Paste the following contents in the .sh file

```
#!/bin/bash                                                                     
{
source /home/exouser/miniconda3/etc/profile.d/conda.sh
conda init
source /home/exouser/.bashrc
conda activate sleap
} > /dev/null 2>&1
sleap-label
```
- Commands in nano
    - Ctrl + o to save (write output)
    - Ctrl + x to exit

4. Set the right permissions

```
chmod +x ~/launch_sleap.sh
```

5. Create a .desktop file

```
nano ~/.local/share/applications/sleap.desktop
```

6. Paste the following contents in the .desktop file

```
[Desktop Entry]
Version=1.0
Type=Application
Name=SLEAP
Comment=Launch SLEAP GUI
Exec=/home/exouser/launch_sleap.sh
Icon=/home/exouser/Downloads/sleapIcon.png
Terminal=true
Categories=Development;
```

7. Set the right permissions

```
chmod +x ~/.local/share/applications/sleap.desktop
```

8. Open all applications with the "Show Apps" icon in the bottom left hand corner of the Web Desktop

9. Drag the SLEAP icon into the dock


### DeepLabCut Desktop shortcut

1. Download the DeepLabCut icon from https://sleap.ai/installation.html
    - Open the side menu on the left and download the image
    - Save the image as deeplabcutIcon.png

2. Create a launch_deeplabcut.sh file

```
nano ~/launch_deeplabcut.sh
```

3. Paste the following contents in the .sh file

```
#!/bin/bash                                                                     
{
source /home/exouser/miniconda3/etc/profile.d/conda.sh
conda init
source /home/exouser/.bashrc
conda activate DEEPLABCUT
} > /dev/null 2>&1
python -m deeplabcut
```
- Commands in nano
    - Ctrl + o to save (write output)
    - Ctrl + x to exit

4. Set the right permissions

```
chmod +x ~/launch_deeplabcut.sh
```

5. Create a .desktop file

```
nano ~/.local/share/applications/deeplabcut.desktop
```

6. Paste the following contents in the .desktop file

```
[Desktop Entry]
Version=1.0
Type=Application
Name=DEEPLABCUT
Comment=Launch DEEPLABCUT GUI
Exec=/home/exouser/launch_deeplabcut.sh
Icon=/home/exouser/Downloads/deeplabcutIcon.png
Terminal=true
Categories=Development;
```
- Commands in nano
    - Ctrl + o to save (write output)
    - Ctrl + x to exit

7. Set the right permissions

```
chmod +x ~/.local/share/applications/deeplabcut.desktop
```

8. Open all applications with the "Show Apps" icon in the bottom left hand corner of the Web Desktop

9. Drag the DeepLabCut icon into the dock

## [Installing DeepLabCut](https://deeplabcut.github.io/DeepLabCut/docs/installation.html)
1. Create a yaml file for DeepLabCut’s environment creation

```
vim DEEPLABCUT.yaml
```

2. Copy the contents from [here](https://github.com/DeepLabCut/DeepLabCut/blob/main/conda-environments/DEEPLABCUT.yaml) into the yaml file
    - After doing vim DEEPLABCUT.yaml in the terminal, perform the following steps:
        1. Copy the raw yaml file from the link
        2. In the Jetstream instance's terminal, press ```i``` to enter INSERT mode
        3. Paste the contents into the file
        4. Press ```esc```
        5. Type ```:wq``` and press ```enter``` to save and exit the file

2. Create the DeepLabCut environment

```
conda env create -f DEEPLABCUT.yaml
```

## [Installing SLEAP](https://sleap.ai/installation.html)

1. Create the SLEAP conda environment and install SLEAP

```
conda create -y -n sleap -c conda-forge -c nvidia -c sleap/label/dev -c sleap -c anaconda sleap=1.4.1
```

## Test the installations were successful

Navigate to the Jetstream instance's Web Desktop, open a terminal, and perform the following steps:

### DeepLabCut

1. Activate the DeepLabCut environment

```
conda activate DEEPLABCUT
```

2. Launch the GUI

```
python -m deeplabcut
```

3. Exit the GUI

4. Deactivate DeepLabCut environment

```
 conda deactivate
```

### SLEAP
1. Activate the SLEAP environment
```
conda activate sleap
```

2. Verify the GPU is successfully detected

```
python3 -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

3. Check the versions installed

```
python3 -c "import sleap; sleap.versions()"
```

4. Check the system summary

```
python3 -c "import sleap; sleap.system_summary()"
```

5. Launch the GUI

```
sleap-label
```
