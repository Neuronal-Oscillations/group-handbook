# Initialise Settings and Folders

## Purpose
These instructions cover downloading the `group-handbook` repository, which contains bash scripts that configure the required folders and system environment variables.

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project `psyc-neuosc` at ARC

## Steps

### 1. Login
- Connect to the VPN
- Connect to ARC (via remote desktop or SSH) — you will land on a gateway node
- SSH into the login node:
  ```bash
  ssh -X htc-login
  ```

### 2. Download the `group-handbook` Repository
Download the repository into `$DATA/git-repos`. The scripts and functions in `group-handbook` will reside there.
```bash
cd $DATA
mkdir -p git-repos
cd git-repos
git clone https://github.com/Neuronal-Oscillations/group-handbook
```

### 3. Set Up the System Environment
Execute the setup script and reload your shell configuration:
```bash
bash group-handbook/code/hpc/setup_sysenv.sh
source ~/.bashrc
```
This defines the paths in `~/.bashrc` needed to use the group functions and ensures a correct environment setup.

### 4. Configure RFS Credentials
The RFS credentials file allows `nog_rfs` to interact with RFS without prompting for your username and password each time.

> **Security note:** The credentials file is stored in your ARC `$HOME` directory, which only you can access, so the security risk is minimal.

`nog_rfs` expects the credentials file at `$HOME/.config/private/rfs_cred` (no file extension). Create it using `nano`:
```bash
mkdir -p $HOME/.config/private

# create file and limit access to user only
touch $HOME/.config/private/rfs_cred
chmod 600 $HOME/.config/private/rfs_cred

# open the file and enter credentials
nano $HOME/.config/private/rfs_cred
```

The file should contain the following (replace with your own details):
```
username=AD-OAK\psycXXXX
password=YOUR-PASSWORD
domain=ox.ac.uk
```
Save with `Ctrl+O` and exit with `Ctrl+X`.
