# Settiingh up MNE Python

## Purpose

Recommendations for installing MNE Python on ARC

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project `psyc-neuosc` at ARC
- Install Neuronal Oscillations Group (NOG) initialisation files (one-time setup); see [Initialise Settings and Folders](initialise.md)


## Steps 
### 1. Login
- Connect to the VPN
- Connect to ARC (via remote desktop or SSH) — you will land on a gateway node
- SSH into the login node:
  ```bash
  ssh -X htc-login
  ```

### 2. Install MNE Python

```bash
cd $DATA/git-repos
bash group-handbook/code/hpc/setup_mne.sh
```

This will download FLUX, install a new MNE environment in `$DATA/environments`and also install a jupyter kernel.
