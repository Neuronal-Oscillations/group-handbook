# HPC scripts
Scripts in this folder are at the moment set up to work with the ARC cluster. Files to interface with RFS will follow.

See [nog_functions](../../docs/data_storage_and_processing) for how to use them.

# Setup scripts and functions:
Download this repository to `$DATA/git-repos`:

```bash
cd $DATA
mkdir -p git-repos
cd git-repos
git clone https://github.com/Neuronal-Oscillations/group-handbook
```

and setup your system environment:
```bash
bash group-handbook/code/hpc/setup_sysenv.sh
```
This will write the required paths and modules to your `~/.bashrc`

Lastly re-source your ~/.bashrc
```bash
source ~/.bashrc
```
Afterwards the `nog_` functions are available to you.
