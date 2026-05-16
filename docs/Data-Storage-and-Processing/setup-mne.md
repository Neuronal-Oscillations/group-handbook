# Setting Up MNE Python

## Purpose

Install MNE Python on ARC for neurophysiological data analysis (MEG, EEG, and related signals). This is a one-time setup that creates a dedicated Python environment and Jupyter kernel for use across your ARC projects.

## Prerequisites

- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project `psyc-neuosc` at ARC
- Neuronal Oscillations Group (NOG) initialisation files installed; see [Initialise Settings and Folders](initialise.md)

## Steps

### 1. Connect to ARC

**Connect to the VPN**, then access ARC via remote desktop or SSH. You will land on a gateway node.

SSH into the login node:

```bash
ssh -X htc-login
```

### 2. Run the MNE Installation Script

Navigate to the group handbook and run the setup script:

```bash
cd $DATA/git-repos
bash group-handbook/code/hpc/setup_mne.sh
```

This script performs the following:
- Downloads and configures FLUX (a compute scheduler)
- Creates a new MNE Python environment in `$DATA/environments`
- Installs the MNE Python package and dependencies
- Registers a Jupyter kernel for this environment (allows use in Jupyter notebooks on ARC)

The installation may take several minutes. Wait for the script to complete.

### 3. Verify Installation

Check that MNE is installed correctly (making sure to use the right Python version):

```bash
source activate mne_env
~/.conda/envs/mne_env/bin/python -c "import mne; print(mne.__version__)"
```

If successful, you will see the MNE version number printed.

## Next Steps

Once installed, you can:

- **Use MNE in scripts**: Activate the environment and run Python scripts that import MNE
- **Use Jupyter notebooks**: The registered kernel allows you to select the MNE environment in Jupyter on ARC
- **Submit batch jobs**: Use MNE scripts within HPC job submissions for large-scale analysis

For usage examples and documentation, see the [MNE Python documentation](https://mne.tools/).

---

<!--
## Troubleshooting
## References
-->
