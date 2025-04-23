# Creating a new Jetstream instance and installing DeepLabCut and SLEAP
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
conda install -c conda-forge mamba
```

8. Install nvitop to monitor GPU usage

```
pip install nvitop
```

## [Installing DeepLabCut](https://deeplabcut.github.io/DeepLabCut/docs/installation.html)
1. Create a yaml file for DeepLabCut’s environment creation

```
vim DEEPLABCUT.yaml
```

- Copy the contents from [here](https://github.com/DeepLabCut/DeepLabCut/blob/main/conda-environments/DEEPLABCUT.yaml) into the yaml file

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