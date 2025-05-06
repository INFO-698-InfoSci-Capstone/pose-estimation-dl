# Docker Documentation

## Installing Docker

### Windows Installation

1. Download Docker Desktop from Docker's official website
2. Run the installer and follow the prompts
3. Ensure WSL 2 is enabled when prompted during installation
4. Launch Docker Desktop after installation
5. Verify installation by opening a terminal and running:

```bash
docker --version
```

### Linux Installation

```bash
# Update package information
sudo apt-get update

# Install dependencies
sudo apt-get install ca-certificates curl gnupg

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Set up repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify installation
docker --version
```

### macOS Installation

1. Download Docker Desktop from Docker's official website
2. Drag the Docker icon to your Applications folder
3. Open Docker from Applications folder
4. Verify installation in terminal:

```bash
docker --version
```

### Common Docker Commands

Container Management

```bash
# List running containers
docker ps

# List all containers (including stopped)
docker ps -a

# Stop a container
docker stop <container_id_or_name>

# Kill a container (force stop)
docker kill <container_id_or_name>

# Remove a container
docker rm <container_id_or_name>

# Remove all stopped containers
docker container prune

# Run a container
docker run [options] <image_name>

# Run a container in detached mode
docker run -d <image_name>

# Run a container with port mapping
docker run -p host_port:container_port <image_name>

# Execute a command in a running container
docker exec -it <container_id_or_name> <command>

# Start a shell in a running container
docker exec -it <container_id_or_name> /bin/bash
```

Image Management

```bash
# List all images
docker images

# Remove an image
docker rmi <image_id_or_name>

# Remove all unused images
docker image prune
```

Logs and Information

``` bash
# View container logs
docker logs <container_id_or_name>

# Follow container logs in real time
docker logs -f <container_id_or_name>

# View container details
docker inspect <container_id_or_name>

# View container resource usage
docker stats
```

### Dockerfile Keywords and Layers

Key Dockerfile Instructions

- FROM: Sets the base image
- RUN: Executes commands in a new layer
- CMD: Provides default command for executing container
- ENTRYPOINT: Configures container to run as executable
- WORKDIR: Sets the working directory
- COPY: Copies files from host to container
- ENV: Sets environment variables
- EXPOSE: Documents which ports the container listens on
- VOLUME: Creates a mount point for external volumes
- USER: Sets the user for subsequent instructions

How Layers Work

- Each instruction in a Dockerfile creates a layer
- Layers are cached and reused when possible for faster builds
- When you change an instruction, Docker rebuilds that layer and all subsequent layers
- Best practice: Order instructions from least to most frequently changing

### Pulling Docker Images

```bash
# Basic image pull
docker pull <image_name>

# Pull a specific version/tag
docker pull <image_name>:<tag>

# Pull from a specific registry
docker pull <registry_url>/<image_name>:<tag>
```

Example:

```bash
# Pull the latest Ubuntu image
docker pull ubuntu

# Pull a specific version of Python
docker pull python:3.10-slim
```

### Building Images and Running Containers

Building an Image

```bash
# Basic build
docker build -t <image_name>:<tag> <path_to_dockerfile_directory>

# Build with a specific Dockerfile name
docker build -t <image_name>:<tag> -f <dockerfile_name> <path>

# Build with no cache
docker build --no-cache -t <image_name>:<tag> <path>
```

Example:

```bash
# Build a simple image
docker build -t myapp:1.0 .
```

Running a Container

```bash
# Basic run
docker run <image_name>

# Run with a name
docker run --name my_container <image_name>

# Run interactively with terminal
docker run -it <image_name> /bin/bash

# Run detached (background)
docker run -d <image_name>

# Run with port mapping
docker run -p 8080:80 <image_name>

# Run with volume mount
docker run -v /host/path:/container/path <image_name>
```

### Pushing Images to a Registry

Logging into Docker Registry

 ```bash
# Login to Docker Hub
docker login

# Login to a custom registry
docker login <registry_url>
 ```

Tagging Images for a Registry

```bash
# Tag an existing image for a registry
docker tag <source_image>:<tag> <registry>/<repository>:<tag>
```

Example:

```bash
# Tag a local image for Docker Hub
docker tag myapp:1.0 username/myapp:1.0
```

Pushing images

```bash
# Push to registry
docker push <registry>/<repository>:<tag>
```

Example:

```bash
# Push to Docker Hub
docker push username/myapp:1.0
```
