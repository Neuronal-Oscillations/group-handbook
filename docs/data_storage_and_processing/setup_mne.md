# Prerequisite
- you are on a login node (not gateway, use `ssh htc-login`)
- System Environment set up (see `first_steps`)

# Install MNE

```bash
cd $DATA/git-repos
bash group-handbook/code/hpc/setup_mne.sh
```

This will download FLUX, install a new MNE environment in `$DATA/environments`and also install a jupyter kernel.
