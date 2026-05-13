# Initialise various setting and folders 
## Purpose
These instructions will serve to download the 'group-handbook' including various bash scripts. This scripts will define the required folders and system variables. 

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC


## Steps 

Login
* Connect to VPN
* Connect to ARC (via remote desktop or SSH). You end up at a gateway node.
* ssh into login node 
  ```
  ssh -X htc-login
  ```
  
Download 'group-handbook' markdown manual and bash scripts 

* Download the repository into `$DATA/git-repos`. Later scripts and functions expect `group-handbook` in `$DATA/git-repos`.

```bash
cd $DATA
mkdir -p git-repos
cd git-repos
git clone https://github.com/Neuronal-Oscillations/group-handbook
```

# Setup System Environment

```bash
bash group-handbook/code/hpc/setup_sysenv.sh
source ~/.bashrc
```

This will write a couple of paths to your `~/.bashrc` that are necessary to use group functions and ensures everything is set up correctly.

# RFS credentials
After setting up the system environment you might have been prompted to create an RFS credentials file.
This is useful, because it allows you to interact with RFS using `nog_rfs` without being prompted for your username and password.

The security risk is minimal, because the credentials file is placed in your ARC `$HOME` directory, which only you can access.

`nog_rfs` expects the credentials file in `$HOME/.config/private` and it should be called `rfs_cred` (no file extension).

The file should look like this:
```bash
username=AD-OAK\psycXXXX
password=your_pass
domain=ox.ac.uk
```
