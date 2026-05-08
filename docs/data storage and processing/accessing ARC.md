# Accessing ARC 
## Purpose
Recommendation for accessing Advanced Research Comnputing (ARC) and understand the architecture of the clusters. 

A typical workflow involves:
1. Copying raw data (typically from RFS; warm data) to the data directory on ARC (hot data)
2. Performing analysis on ARC
3. Copying output data back to the core store (typically RFS)

## Prerequisites
- A SSO (Single Sign-On) account at the University of Oxford
- VPN access to the University of Oxford network (required for off-site access)
- An account on the project psyc-neuosc at ARC
  
## Steps

### Requesting access to the ARC 

The Neuronal Oscillations project on the ARC infrastructure is called "psyc-neuosc". Users can apply for individual accounts on the ARC systems by visiting the [OxIntranet page](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting the psyc-neuosc project.The Neuronal Oscillations project on the ARC infrastructure is called "psyc-neuosc". Users can apply for individual accounts on the ARC systems by visiting the [OxIntranet page](https://unioxfordnexus.sharepoint.com/sites/OxIntranet-research-innovation/SitePages/ARC-accessing-ARC.aspx?Mode=Edit#requesting-a-user-account) and selecting the psyc-neuosc project.


### Accessing the ARC using the NoMachine client software

1. Connect via web browser to [NoMachine](https://www.nomachine.com/)
2. Ensure you are on the VPN network
2. Run NoMachine
3. Add the host `nx.arc.ox.ac.uk`
4. Login with Oxford SSO
4. Select "Create a new virtual desktop"
5. Once the desktop opens, launch applications from the menu (bottom left corner)

The abobe steps bring you to an entry node. The next step is to nagivate to an htc node write

`ssh -X htc-login`

<img width="1132" height="608" alt="image" src="https://github.com/user-attachments/assets/252fa44f-49cc-4556-a747-4bcbb9ccaf06" />

   
### Coyping files to and from ARC

#### Data folders on ARC explained

- **RFS (warm data)**: Not mounted automatically
- **$HOME folder (no for data)**: 5 GB (view with `echo $HOME`)
- **$DATA folder (hot data)**: 15 TB (view with `echo $DATA`)
  
Typically, you will copy data from RDS or other sources to the `$DATA` folder for analysis, then copy processed data back to RFS after completion.


#### Windows (Command Line - recommended)

Start Terminal in Windows

**From ARC to Windows:**
```bash
scp psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/mydata/* C:\Users\bobhanson\
```
This copies the `mydata` folder (and subfolders) from the ARC data directory (`$DATA`) to your C: drive.
 
**From Windows to ARC:**
```bash
scp -r C:\Users\bobhanson\mydata\* psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/
```
This copies the `mydata` folder (and subfolders) from your C: drive to the ARC data directory (`$DATA`). The `-r` flag enables recursive copying of all subfolders.


#### Windows (Graphical Interface Alternative - not recommended)

1. Download and install [WinSCP](https://winscp.net/eng/docs/installation)
2. Connect to `gateway.arc.ox.ac.uk` using your credentials
3. Navigate to your ARC data directory
4. Drag and drop files between your Windows machine and ARC
5. To access RFS, navigate to the mapped network drive (e.g., R:)
- <img width="813" height="549" alt="image" src="https://github.com/user-attachments/assets/eb9b564f-71c4-4c21-920d-032798bc9bdf" />

#### macOS (Command Line)

Start Terminal in MacOS 

**From ARC to macOS:**
```bash
`scp psyc9999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/mydata/* /Users/bobhanson/`
```
This copies the `mydata` folder (and subfolders) from ARC to your local drive.
 
**From macOS to ARC:**
```bash
`scp /Users/bobhanson/maydata/* psyc999@gateway.arc.ox.ac.uk:/data/psyc-neuosc/psyc9999/`
```
This copies the `mydata` folder (and subfolders) from your local folder to the ARC data directory. The `-r` flag enables recursive copying.

  
### Cloning github to ARC $HOME directory

Start a terminal in ARC under  [nx.arc.ox.ac.uk](https://nx.arc.ox.ac.uk/):

Make a directory under $HOME that for where you want the local repository and move there. 

```bash
mkdir $DATA/Python/FLUX
cd $DATA/Python/FLUX
```

Log into your github.com account and find the repository do clone; e.g.

```bash
git clone https://github.come/FLUX-pipeline/Cerca
```

Clone only needs to be done once. To later pull latest changes from central to local repository 
```bash
git pull https://github.come/FLUX-pipeline/Cerca
```

Changes can now be made to e.g. FILE.PY

To  add latest changes from local to central repository 
```bash
git add FILE.PY
git commit -m "DESCRIPTION OF CHANGES"
git push origin main
```




### Running MNE Python in Jupyter Notebook on ARC
Before you can install or run the environment you must switch to a compute node:
```bash
srun --mem=16G --time=02:00:00 --pty bash
```
Note: Using `srun` you submit an interactive job to the compute node. This is equivalent to `sbatch`, which you use to submit jobs to the compute 
node that you cannot interact with.

If you are on a gateway node (via remote desktop or VPN) you first need to log in to a login node before you can submit the interactive job above:
```bash
ssh htc-login
```

#### Installation of MNE Python and MNE BIDS
Note, that you MUST store everything (including environments or cache files) on the data storage (`$DATA`) and not your home folder. `$HOME` has only 5GB of storage.
In order to make conda store everything in the data folder and not home, we need to make some modifications to the current environment.

First, create and specify the new conda cache directories outside `$HOME`:

```bash
rm -f ~/.condarc # Yes, this one still lives in $HOME

# Create directories (change to your liking)
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
EOF
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
