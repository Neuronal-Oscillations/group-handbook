
# Installaton of MNE Python
## Purpose

Demonstrating the steps for installing the Firefox web-browser. It will be installed in the $DATA directory. 

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
  
## Installation

1. Connect via web browser to [NoMachine](https://www.nomachine.com/)
2. Ensure you are on the VPN network
2. Run NoMachine
3. Add the host `nx.arc.ox.ac.uk`
4. Login with Oxford SSO
4. Select "Create a new virtual desktop"
5. Once the desktop opens, launch applications from the menu (bottom left corner)

Nagivate to an login htc node 

```
ssh -X htc-login
```

Navigate to htc node write

```
srun -p interactive --x11 --pty /bin/bash
```

Remove old stuff. 
`rm -f ~/.condarc'


If they dont exist, create directories
```
ENV_DIR="${DATA}/environments"
mkdir -p "${ENV_DIR}"

mkdir -p "${ENV_DIR}/.conda"
mkdir -p "${ENV_DIR}/.conda/pkgs"
mkdir -p "${ENV_DIR}/.conda/envs"
```

Now you are set for createing a new environment.

First time:
```bash
conda create -p $DATA/firefox -c conda-forge firefox
```

After installation activate

```bash
conda activate /data/psyc-neuosc/psyc1854/firefox
env -u LD_LIBRARY_PATH firefox
```

## To run Firefox


Activate firefox: 
```
conda activate /data/psyc-neuosc/psyc1854/firefox
```
```bash
firefox
```



###
[The ARC user guide](https://arc-user-guide.readthedocs.io/en/latest/introduction.html)


<!--
## Verification
## Troubleshooting
## References

-->
