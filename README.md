# Repository README

Welcome to the Pose Estimation Deep Learning Project Repository!

This repository is organized as a reproducible research compendium for pose estimation using SLEAP and DeepLabCut. It contains code, data, documentation, and logs to support transparent, collaborative, and reproducible research.

---



## How to Navigate This Repository

- **README.md**
  You are here! Start here for an overview and navigation tips.

- **analysis/**
  Contains all analysis-related materials:
  - `docs/` – User guides, technical documentation, and workflow instructions.
  - `logs/` – Weekly/bi-weekly logs using the Rose/Bud/Thorn model for project tracking and reflection.
  - `data/` – Data used for analysis, including raw and derived datasets.
  - `dockerfiles/` – Dockerfiles for building reproducible computational environments.
  - `notes/` – Supplementary notes, link collections, and workflow tips.

- **src/**
  Source code for scripts and pipelines used in the project.

- **CONDUCT.md**
  Contributor Code of Conduct. Please read before contributing.

---

## How to Contribute

We welcome contributions from the community! To ensure high standards of reproducibility and open science, please follow these guidelines:

### 1. Reproducible Research Best Practices

- **Document Everything:**
  Clearly comment your code and document workflows in the appropriate `docs/` files.
- **Use Version Control:**
  Make all changes via pull requests and provide clear commit messages.
- **Environment Management:**
  Use Dockerfiles or `environment.yml` files to specify dependencies. Avoid "it works on my machine" issues.
- **Data Provenance:**
  Place raw data in `analysis/data/rawData/` and derived data in `analysis/data/derivedData/`. Document data sources and processing steps.
- **Logs:**
  Use the Rose/Bud/Thorn format in `analysis/logs/` to track progress and challenges.

### 2. Open Source Best Practices

- **Respect the Code of Conduct:**
  See [CONDUCT.md](../CONDUCT.md) for our community guidelines.
- **Attribution:**
  Credit all contributors and reference external resources appropriately.
- **Licensing:**
  Ensure your contributions comply with the repository’s license.
- **Issues and Pull Requests:**
  - Open an issue for bugs, feature requests, or questions.
  - Fork the repository, create a feature branch, and submit a pull request for changes.
  - Reference related issues in your pull request description.

### 3. General Workflow

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd pose-estimation-dl
   ```


2. Set up your environment:

- Use the provided Dockerfiles or Conda/Mamba environment files for reproducibility.

3. Add or modify content:

- Place new scripts in src/
- Add documentation to analysis/docs/
- Log your work in analysis/logs/

4. Test your changes:

- Ensure your code runs in a clean environment.
- Add tests or example notebooks if appropriate.

5. Submit your contribution:

- Open a pull request with a clear description of your changes and their purpose.

### Additional Resources
- [Reproducible Research Wiki](https://github.com/ua-datalab/Reproducible-Research/wiki)
- [DL Pose Estimation Wiki](https://github.com/ua-datalab/DL-pose-estimation/wiki)
