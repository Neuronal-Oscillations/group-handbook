
# Installaton of MNE Python
## Purpose

Demonstrating the steps for installing the Firefox web-browser. It will be installed in the $DATA directory. 

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
  
## Steps

1. Connect via web browser to [NoMachine](https://www.nomachine.com/)
2. Ensure you are on the VPN network
2. Run NoMachine
3. Add the host `nx.arc.ox.ac.uk`
4. Login with Oxford SSO
4. Select "Create a new virtual desktop"
5. Once the desktop opens, launch applications from the menu (bottom left corner)

Nagivate to an login htc node 
`ssh -X htc-login`

Navigate to htc node write

srun -p interactive --x11 --pty /bin/bash`

Remove old stuff. 
`rm -f ~/.condarc'


If they dont exist, create directories
```
ENV_DIR="${DATA}/environments"
mkdir -p "${ENV_DIR}"

mkdir -p "${ENV_DIR}/.conda"
mkdir -p "${ENV_DIR}/.conda/pkgs"
mkdir -p "${ENV_DIR}/.conda/envs"

cat >> ~/.condarc <<EOF
pkgs_dirs:
  - $ENV_DIR/.conda/pkgs

envs_dirs:
  - $ENV_DIR/.conda/envs
```

Now you are set for createing a new environment.

First time:
```bash
module load Anaconda3/2024.02-1 
conda create -p $DATA/mne_env python=3.11 mne jupyter jupyterlab -c conda-forge 
```

After installation activate

```bash
source activate mne_env
```

First time you need to nstall mne-bids:
```bash
conda install --channel conda-forge mne-bids
```

And activate again
```bash
source activate mne_env
```
The final step is link the MNE environtment to Jupyter:
```bash
python -m ipykernel install --user --name=mne --display-name "Python (MNE)"
```
#### Jupyter

Now start Jupyher and change to the MNE Kernel: 

1. Launch Jupyter Notebook (go to '>' in lower left corner of the NoMachine interface and find Jupyter under applications (use the command `/apps/common/arc-app-startup/jupyter/Anaconda3-2022.05`).
2. Open your desired notebook (e.g. the FLUX scripts).
3. Go to the top menu and select Kernel 
4.Change kernel.Choose "Python (MNE)" from the list.

This will allow you to run the FLUX pipeline


###
[The ARC user guide](https://arc-user-guide.readthedocs.io/en/latest/introduction.html)


<!--
## Verification
## Troubleshooting
## References

-->
