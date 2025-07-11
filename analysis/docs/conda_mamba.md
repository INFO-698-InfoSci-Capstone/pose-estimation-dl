# Conda and Mamba: Dependency Management

## What Are Dependency Managers For?

Dependency managers help you install, update, and manage software packages and their dependencies. They ensure that all required libraries and tools are available and compatible, making it easier to reproduce environments and avoid conflicts.

## Pros and Cons of Conda and Mamba

### Pros
- **Cross-platform:** Both work on Windows, macOS, and Linux.
- **Environment management:** Easily create isolated environments for different projects.
- **Binary packages:** Install pre-built binaries, reducing build times.
- **Mamba is fast:** Mamba is a drop-in replacement for conda, written in C++, and significantly speeds up environment solving and package installation.

### Cons
- **Large base install:** Conda environments can be large due to bundled dependencies.
- **Channel confusion:** Multiple channels can lead to dependency conflicts.
- **Mamba limitations:** Mamba may not support all conda features or plugins.

## How to Create an Environment

```bash
# Using conda
conda create -n myenv python=3.10

# Using mamba
mamba create -n myenv python=3.10
```

### Why You Create Environments
- To isolate project dependencies and avoid conflicts.
- To ensure reproducibility across different systems.
- To test code with different versions of libraries.

### How to Install Things
```bash
# Using conda
conda install numpy pandas

# Using mamba
mamba install numpy pandas
```

### How to Ensure Version Compatibility and Dependency Resolution

- Specify exact package versions when creating or updating environments.
- Use environment.yml files to define all dependencies.
- Let conda/mamba resolve dependencies automatically, but review the plan before confirming.
- Regularly update environments and check for conflicts.


```bash
# Export environment
conda env export > environment.yml

# Create environment from file
conda env create -f environment.yml
```
### Additional Useful Conda and Mamba Commands

```bash
# List all environments
conda env list
mamba env list

# Activate an environment
conda activate myenv
mamba activate myenv

# Deactivate the current environment
conda deactivate
mamba deactivate

# List installed packages in the current environment
conda list
mamba list

# Update a specific package
conda update numpy
mamba update numpy

# Update all packages in the environment
conda update --all
mamba update --all

# Remove a package from the environment
conda remove pandas
mamba remove pandas

# Remove an environment completely
conda env remove -n myenv
mamba env remove -n myenv

# Search for a package
conda search scipy
mamba search scipy

# Clean up unused packages and caches
conda clean --all
mamba clean --all
