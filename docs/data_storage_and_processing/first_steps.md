# First things first

- connect to VPN
  
- connect to ARC (via remote desktop or SSH). You end up at a gateway node.
  
- ssh into login node (`ssh htc-login`)
  

# Using Neuronal Oscillations Group code

Download the repository into `$DATA/git-repos`. Later scripts and functions expect `group-handbook` in `$DATA/git-repos`.

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
