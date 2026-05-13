# Initialise various setting and folders 
## Purpose
These instructions will serve to download the 'group-handbook' including various bash scripts. This scripts will define the required folders and system variables. 

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC


## Steps 

### Login
* Connect to VPN
* Connect to ARC (via remote desktop or SSH). You end up at a gateway node.
* ssh into login node 
  ```
  ssh -X htc-login
  ```
  
### Download 'group-handbook' markdown manual and bash scripts 
* Download the repository into `$DATA/git-repos`. The scripts and functions in `group-handbook` will reside in `$DATA/git-repos`.
```bash
cd $DATA
mkdir -p git-repos
cd git-repos
git clone https://github.com/Neuronal-Oscillations/group-handbook
```

### Setup System Environment
* Execute the bash-script `setup_sysenv.sh`:
```bash
bash group-handbook/code/hpc/setup_sysenv.sh
source ~/.bashrc
```

This will define paths in `~/.bashrc` necessary to use the group functions and ensure a correct setup.

### RFS credentials
The RFS credentials file allows you to interact with RFS using `nog_rfs` (that we will set up later) without being prompted for your username and password. The security risk is minimal, because the credentials file is placed in your ARC `$HOME` directory, which only you can access. `nog_rfs` expects the credentials file in `$HOME/.config/private` and it should be called `rfs_cred` (no file extension).

The file should look like this:
```bash
username=AD-OAK\psycXXXX
password=your_pass
domain=ox.ac.uk
```

This can be done using the editor `nano` :
```
nano $HOME/.config/private/rfs_cred
```
