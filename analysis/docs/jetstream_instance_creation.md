# Creating a Jetstream Instance through Exosphere and installing DeepLabCut, SLEAP, and Jupyter 

## Create a base Jetstream instance

1. In your allocation, go to Create and select Instance

![Jetstream instance creation](images/jetstream_create_instance.png)

2. Choose the latest Ubuntu image as the instance source

![Jetstream image selection](images/jetstream_image_selection.png)

3. When configuring the instance, give it a name, select the g3.medium flavor, and enable the web desktop

![Jetstream instance configuration 1](images/jetstream_instance_configuration1.png)

![Jetsream instance configuration 2](images/jetstream_instance_configuration2.png)

4. Once the instance has finished building, navigate to its web desktop

![Jetstream instance web desktop](images/jetstream_web_desktop.png)

## Conda installation

1. Open the terminal in the web desktop

![Jetstream instance terminal](images/jetstream_instance_terminal.png)

2. Paste and run the following code:

```
sudo wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/miniconda.sh
```

3. Set the permissions of miniconda.sh to read, write, and execute

```
sudo chmod 777 /opt/miniconda.sh
```

4. Install conda in /opt

```
sudo /opt/miniconda.sh -b -p /opt/miniconda3
```

5. Modify the permissions of /opt/miniconda3

```
sudo chown -R $USER:$USER /opt/miniconda3
```

6. Add conda to path

```
export PATH=/opt/miniconda3/bin:$PATH
```

7. Initialize conda

```
conda init
```

8. Initialize conda system wide

    - Open the global shell configuration file

    ```
    sudo vim /etc/bash.bashrc
    ```

    - Press `i`, then add the following lines to the bottom of the file

    ```
    . /opt/miniconda3/etc/profile.d/conda.sh
    conda activate base
    ```

    - After doing adding these lines to the bottom of the file:
        1. Press `esc` to exit `INSERT` mode
        2. Type `:wq` and press `enter` to save and exit the file

9. Restart the terminal

```
 source ~/.bashrc
```

10. Activate the base conda environment

```
 conda activate base
```

11. Install conda dependencies

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

## [Installing DeepLabCut](https://deeplabcut.github.io/DeepLabCut/docs/installation.html)

1. Set the working directory to `/usr/local`

```
cd /usr/local
```

2. Create a yaml file for DeepLabCut’s environment creation

```
vim DEEPLABCUT.yaml
```

3. Copy the contents from [here](https://github.com/DeepLabCut/DeepLabCut/blob/main/conda-environments/DEEPLABCUT.yaml) into the yaml file
- After doing ```vim DEEPLABCUT.yaml``` in the terminal, perform the following steps:
    1. Copy the raw yaml file from the link
    2. In the file, press ```i``` to enter INSERT mode
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

## Setup the environment and notebook files for Jupyter

### Jupyter environment creation

1. Create a conda environment with Jupyter installed:

```
conda create -n jupyter python=3.10 ipython jupyter nb_conda 'notebook<7.0.0' -y
```

### Download DeepLabCut and SLEAP notebooks

1. Create new directories to store the notebooks

```
sudo mkdir -p /usr/local/jupyter_notebooks/deeplabcut
```

```
sudo mkdir -p /usr/local/jupyter_notebooks/sleap
```

2. Download the [DeepLabCut notebooks](https://github.com/DeepLabCut/DeepLabCut/blob/main/examples/README.md)   
    1. [Demo on your own data](https://github.com/DeepLabCut/DeepLabCut/blob/main/examples/JUPYTER/Demo_yourowndata.ipynb)
    2. [Training and evaluating a network](https://colab.research.google.com/github/DeepLabCut/DeepLabCut/blob/master/examples/COLAB/COLAB_YOURDATA_TrainNetwork_VideoAnalysis.ipynb)
    3. [Model Zoo](https://colab.research.google.com/github/DeepLabCut/DeepLabCut/blob/master/examples/COLAB/COLAB_DLC_ModelZoo.ipynb)

![DeepLabCut notebooks](images/jetstream_deeplabcut_notebooks.png)

4. Move the DeepLabCut notebooks to the proper directory

    - If the DeepLabCut notebooks are the only files in the Downloads folder then you can do:

    ```
    sudo mv ~/Downloads/* /usr/local/jupyter_notebooks/deeplabcut
    ```


    - Otherwise if there are other files in the downloads folder:

    ```
    cd ~/Downloads
    ```

    ```
    sudo mv DeepLabCut_Latest_Colab_TrainNetwork_VideoAnalysis.ipynb DeepLabCut_Demo_yourowndata.ipynb DeepLabCut_COLAB_DLC_ModelZoo.ipynb /usr/local/jupyter_notebooks/deeplabcut
    ```

5. Download the [SLEAP notebooks](https://sleap.ai/notebooks/index.html)
    1. [Training and inference on an example dataset](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Training_and_inference_on_an_example_dataset.ipynb)
    2. [Training and inference on your own data](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Training_and_inference_using_Google_Drive.ipynb)
    3. [Analysis examples](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Analysis_examples.ipynb)
    4. [Data structures](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Data_structures.ipynb)
    5. [Post inference tracking](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Post_inference_tracking.ipynb)
    6. [Interactive training](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Interactive_and_resumable_training.ipynb)
    7. [Interactive and realtime inference](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Interactive_and_realtime_inference.ipynb)
    8. [Model evaluation](https://colab.research.google.com/github/talmolab/sleap/blob/main/docs/notebooks/Model_evaluation.ipynb)

![Jetstream SLEAP notebooks](images/jetstream_sleap_notebooks.png)

6. Move the SLEAP notebooks to the proper directory

    - If the SLEAP notebooks are the only files in the Downloads folder:

    ```
    sudo mv ~/Downloads/* /usr/local/jupyter_notebooks/sleap
    ```

    - Otherwise if there are other files in the downloads folder:

    ```
    cd ~/Downloads
    ```

    ```
    sudo mv Training_and_inference_using_Google_Drive.ipynb Training_and_inference_on_an_example_dataset.ipynb SLEAP_Post_inference_tracking.ipynb SLEAP_Interactive_and_resumable_training.ipynb SLEAP_Interactive_and_realtime_inference.ipynb SLEAP_Data_structures.ipynb Model_evaluation.ipynb Analysis_examples.ipynb
    ```


## Create Desktop shortcuts for SLEAP, DeepLabCut, Jupyter, and nvitop

- First create a directory in `/usr/local` to store all desktop shortcut related files

```
sudo mkdir -p /usr/local/shortcut-files
```

### SLEAP desktop shortcut

1. Download the SLEAP icon from https://sleap.ai/installation.html
    1. Open the side menu on the left and download the image
    2. Save the image as sleapIcon.png
    3. Move the image file to `/usr/local/shortcut-files` 

    ```
    sudo mv /home/exouser/Downloads/sleapIcon.png /usr/local/shortcut-files
    ```

2. Create a launch_sleap.sh file

```
sudo vim /usr/local/shortcut-files/launch_sleap.sh
```

3. Paste the following contents in the .sh file

```
#!/bin/bash
{
source /etc/bash.bashrc
conda activate sleap
} > /dev/null 2>&1
/opt/miniconda3/envs/sleap/bin/sleap-label
```

- After doing ```sudo vim /usr/local/shortcut-files/launch_sleap.sh``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press `i` to enter INSERT mode
    3. Paste the contents into the file
    4. Press `esc`
    5. Type ```:wq``` and press ```enter``` to save and exit the file

4. Set the right permissions

```
sudo chmod +x /usr/local/shortcut-files/launch_sleap.sh
```

5. Create a .desktop file in `/usr/share/applications`

```
sudo vim /usr/share/applications/sleap.desktop
```

6. Paste the following contents in the .desktop file

```
[Desktop Entry]
Version=1.0
Type=Application
Name=SLEAP
Comment=Launch SLEAP GUI
Exec=/usr/local/shortcut-files/launch_sleap.sh
Icon=/usr/local/shortcut-files/sleapIcon.png
Terminal=true
Categories=Development;
```

- After doing ```sudo vim /usr/share/applications/sleap.desktop``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

7. Set the right permissions

```
sudo chmod +x /usr/share/applications/sleap.desktop
```

8. Open all applications with the "Show Apps" icon in the bottom left hand corner of the Web Desktop

9. Drag the SLEAP icon into the dock


### DeepLabCut desktop shortcut

1. Download the DeepLabCut icon from https://deeplabcut.github.io/DeepLabCut/docs/installation.html
    1. Open the side menu on the left and download the image
    2. Save the image as deeplabcutIcon.png
    3. Move the image file to `/usr/local/shortcut-files` 

    ```
    sudo mv /home/exouser/Downloads/deeplabcutIcon.png /usr/local/shortcut-files
    ```

2. Create a launch_deeplabcut.sh file

```
sudo vim /usr/local/shortcut-files/launch_deeplabcut.sh
```

3. Paste the following contents in the .sh file

```
#!/bin/bash
{
source /etc/bash.bashrc
conda activate DEEPLABCUT
} > /dev/null 2>&1
/opt/miniconda3/envs/DEEPLABCUT/bin/python /opt/miniconda3/envs/DEEPLABCUT/lib/python3.10/site-packages/deeplabcut/__main__.py
```

- After doing ```sudo vim /usr/local/shortcut-files/launch_deeplabcut.sh``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

4. Set the right permissions

```
sudo chmod +x /usr/local/shortcut-files/launch_deeplabcut.sh
```

5. Create a .desktop file

```
sudo vim /usr/share/applications/deeplabcut.desktop
```

6. Paste the following contents in the .desktop file

```
[Desktop Entry]
Version=1.0
Type=Application
Name=DEEPLABCUT
Comment=Launch DEEPLABCUT GUI
Exec=/usr/local/shortcut-files/launch_deeplabcut.sh
Icon=/usr/local/shortcut-files/deeplabcutIcon.png
Terminal=true
Categories=Development;
```

- After doing ```sudo vim /usr/share/applications/deeplabcut.desktop``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

7. Set the right permissions

```
sudo chmod +x /usr/share/applications/deeplabcut.desktop
```

8. Open all applications with the "Show Apps" icon in the bottom left hand corner of the Web Desktop

9. Drag the DeepLabCut icon into the dock

### Jupyter desktop shortcut

1. Download the Jupyter icon from the web browser and save it as "jupyterIcon.png"
    - Move the image file to `/usr/local/shortcut-files` 

    ```
    sudo mv /home/exouser/Downloads/jupyterIcon.png /usr/local/shortcut-files
    ```

2. Create a launch_jupyter.sh file

```
sudo vim /usr/local/shortcut-files/launch_sleap.sh
```

3. Paste the following contents in the .sh file

```
#!/bin/bash
{
source /etc/bash.bashrc
conda activate sleap
} > /dev/null 2>&1
/opt/miniconda3/envs/sleap/bin/sleap-label
```

- After doing ```sudo vim /usr/local/shortcut-files/launch_sleap.sh``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

4. Set the right permissions

```
sudo chmod +x /usr/local/shortcut-files/launch_sleap.sh
```

5. Create a .desktop file

```
sudo vim /usr/share/applications/sleap.desktop
```

6. Paste the following contents in the .desktop file

```
[Desktop Entry]
Version=1.0
Type=Application
Name=SLEAP
Comment=Launch SLEAP GUI
Exec=/usr/local/shortcut-files/launch_sleap.sh
Icon=/usr/local/shortcut-files/sleapIcon.png
Terminal=true
Categories=Development;
```

- After doing ```sudo vim /usr/share/applications/sleap.desktop``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

7. Set the right permissions

```
sudo chmod +x /usr/share/applications/sleap.desktop
```

8. Open all applications with the "Show Apps" icon in the bottom left hand corner of the Web Desktop

9. Drag the Jupyter icon into the dock

### nvitop desktop shortcut

1. Download an image to use as the nvitop icon from the web browser and save it as "nvitopIcon.png"
    - Move the image file to `/usr/local/shortcut-files` 

    ```
    sudo mv /home/exouser/Downloads/nvitopIcon.png /usr/local/shortcut-files/
    ```

2. Create a launch_nvitop.sh file

```
sudo vim /usr/local/shortcut-files/launch_nvitop.sh
```

3. Paste the following contents in the .sh file

```
#!/bin/bash                           
{
source /etc/bash.bashrc
conda activate base
} > /dev/null 2>&1
/opt/miniconda3/bin/nvitop
```

- After doing ```sudo vim /usr/local/shortcut-files/launch_nvitop.sh``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

4. Set the right permissions

```
sudo chmod +x /usr/local/shortcut-files/launch_nvitop.sh
```

5. Create a .desktop file

```
sudo vim /usr/share/applications/nvitop.desktop
```

6. Paste the following contents in the .desktop file

```
[Desktop Entry]
Version=1.0
Type=Application
Name=nvitop
Comment=Launch nvitop
Exec=/usr/local/shortcut-files/launch_nvitop.sh
Icon=/usr/local/shortcut-files/nvitopIcon.png
Terminal=true
Categories=Development;
```

- After doing ```sudo vim /usr/share/applications/nvitop.desktop``` in the terminal, perform the following steps:
    1. Copy the contents from the code chunk
    2. In the file, press ```i``` to enter INSERT mode
    3. Paste the contents into the file
    4. Press ```esc```
    5. Type ```:wq``` and press ```enter``` to save and exit the file

7. Set the right permissions

```
sudo chmod +x /usr/share/applications/nvitop.desktop
```

8. Open all applications with the "Show Apps" icon in the bottom left hand corner of the Web Desktop

9. Drag the nvitop icon into the dock

## Add the shorcut icons to the desktop's dock

1. Get the list of apps currently in the dock

```
gsettings get org.gnome.shell favorite-apps
```

- This will return a list such as

    ```
    ['firefox.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'yelp.desktop']
    ```

2. Add the newly created shortcuts to the dock

```
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'sleap.desktop', 'deeplabcut.desktop', 'jupyter.desktop', 'filezilla.desktop', 'nvitop.desktop', 'org.gnome.Terminal.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'yelp.desktop']"
```